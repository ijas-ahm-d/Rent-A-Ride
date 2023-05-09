import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:rent_a_ride/components/common/common_snackbar.dart';
import 'package:rent_a_ride/models/payment_model.dart';
import 'package:rent_a_ride/repo/api_services.dart';
import 'package:rent_a_ride/repo/api_status.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Errors? _errors;
  Errors? get errors => _errors;

  PaymentModel? _paymentModel;
  PaymentModel? get paymentModel => _paymentModel;

  // Map<String, dynamic>? _paymentIntent;
  // Map<String, dynamic>? get paymentIntent => _paymentIntent;

  setError(Errors error, context) async {
    _errors = error;
    return errorResponses(_errors!, context);
  }

  setLoading(bool isLoad) {
    _isLoading = isLoad;
    notifyListeners();
  }

  //GET THE ACCESSTOKEN
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("ACCESS_TOKEN");
    return accessToken;
  }
  // setPaymentIntent(Map<String, dynamic>? paymentIntent) {
  //   _paymentIntent = paymentIntent;
  //   log("#####$paymentIntent######");
  //   notifyListeners();
  // }

  setPaymentModel(PaymentModel? paymentModel) {
    _paymentModel = paymentModel;
    log(paymentModel!.id.toString());
    notifyListeners();
  }

  Future<void> payAmount(
      {required String amount,
      required BuildContext context,
      required String bookingID}) async {
    try {
      // _paymentIntent =
      await createPaymentIntent(amount: amount, context: context);
      log(_paymentModel!.clientSecret.toString());
      await Stripe.instance
          .initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: _paymentModel!.clientSecret,
            style: ThemeMode.dark,
            billingDetails: const BillingDetails(
              email: "ijas@gmail.com",
              phone: '2929192030',
              address: Address(
                  city: "Calicut",
                  country: 'india',
                  line1: "lkansd",
                  line2: "anidfo",
                  postalCode: "asfina",
                  state: "sadnfas"),
            ),
            merchantDisplayName: "Ijas"),
      )
          .then((value) {
        displayPaymentSheet(
            amount: amount, bookingId: bookingID, context: context);
      });
    } catch (e) {
      log("BBBBBBBB");
      log(e.toString());
    }
  }

  createPaymentIntent(
      {required String amount, required BuildContext context}) async {
    log("aaaaaaaa");
    setLoading(true);

    Map<String, String> headers = {
      'Authorization': 'Bearer ${Urls.secret}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    Map<String, dynamic> body = {
      'amount': calculateAmount(amount),
      'currency': "INR",
      'payment_method_types[]': 'card',
      'receipt_email': 'ija@gamil.com'
    };
    String url = Urls.payment;
    final response = await ApiServices.postMethod(
      url: url,
      data: body,
      headers: headers,
      function: paymentModelFromJson,
    );
    log("OOOOOOOOOOOOOOOOOOOOOOOOOO");
    if (response is Success) {
      if (response.response != null) {
        // return response.response;
        log("--------------------------------");
        _paymentModel = response.response as PaymentModel;
        log("ppppppppppppppppppppppp");
        // setPaymentIntent(response.response as Map<String, dynamic>);
        // setPaymentModel(response.response as PaymentModel);
      }
    }
    if (response is Failures) {
      setLoading(false);
      log("=+++++++++++++++++++++++++++++++++++++");
      Errors error = Errors(
        code: response.code,
        message: response.responseMsg,
      );
      // ignore: use_build_context_synchronously
      await setError(error, context);
    }

    setLoading(false);
  }

  displayPaymentSheet(
      {required BuildContext context,
      required String amount,
      required String bookingId}) async {
    try {
      // await Stripe.instance.createToken();
      await Stripe.instance.presentPaymentSheet().then((value) {
        paymentToBackend(bookingId: bookingId, totalAmount: amount);
        log("!!!!!!${paymentModel!.id}");
        log(paymentModel!.invoice.toString());
        log(paymentModel!.transferData.toString());
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      Text("Payment Successfull"),
                    ],
                  ),
                ],
              ),
            );
          },
        );
        // _paymentModel = null;
      }).onError((error, stackTrace) {
        log("Error is :---> $error $stackTrace");
      });
    } on StripeException catch (e) {
      log("Error is :---> $e");
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text("Cancelled"),
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }

  errorResponses(Errors error, BuildContext context) {
    final statusCode = error.code;

    if (statusCode == 400 || statusCode == 401) {
      return CommonSnackBAr.snackBar(
          context: context, data: "Something happened", color: snackbarRed);
    }
    return CommonSnackBAr.snackBar(
      context: context,
      data: "No internet connection",
      color: snackbarRed,
    );
  }

  paymentToBackend({
    required String bookingId,
    required String totalAmount,
  }) async {
    log("!@#%^&$_paymentModel");
    final url = Urls.baseUrl + Urls.user + Urls.userPayment;
    final accessToken = await getAccessToken();
    var headers = {"authorization": "Bearer $accessToken"};
    Map<String, dynamic> body = {
      "bookingId": bookingId,
      "token": _paymentModel,
    };
    final response = await ApiServices.postMethod(
      url: url,
      data: body,
      headers: headers,
    );

    if (response is Success) {
      log(response.response.toString());
    }
    if (response is Failures) {
      log(response.responseMsg.toString());
    }
  }
}

class Errors {
  int? code;
  Object? message;

  Errors({
    this.code,
    this.message,
  });
}
