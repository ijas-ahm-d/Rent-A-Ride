import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/utils/url.dart';
import 'package:rent_a_ride/view_model/booking_view_model.dart';
import 'package:rent_a_ride/view_model/payment_view_model.dart';
import 'package:rent_a_ride/view_model/payments_view_model.dart';
// import 'package:rent_a_ride/view_model/payment_view_model.dart';

class CarPaymentScreen extends StatefulWidget {
  const CarPaymentScreen({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<CarPaymentScreen> createState() => _CarPaymentScreenState();
}

class _CarPaymentScreenState extends State<CarPaymentScreen> {
  Map<String, dynamic>? paymentIntents;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingViewModel>().bookingDetail;
    final payment = Provider.of<PaymentViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kBlack,
          ),
        ),
        title: Text(
          "Payment Section",
          style: textstyle(18, FontWeight.w500, kBlack),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SpaceWH(height: 20),

            // Text(index == null ? "null" : "${index.toString()}"),
            Container(
              padding: const EdgeInsets.all(20),
              height: 200,
              child: Image.asset("assets/images/carLogo.png"),
            ),
            const SpaceWH(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "From",
                  style: textstyle(15, FontWeight.normal, kBlack),
                ),
                Row(
                  children: [
                    Text("${provider!.bookedSlots!.from!.day}"),
                    Text("/${provider.bookedSlots!.from!.month}"),
                    Text("/${provider.bookedSlots!.from!.year}"),
                    const SpaceWH(width: 10),
                    Text("${provider.bookedSlots!.from!.hour}"),
                    Text(":${provider.bookedSlots!.from!.minute}"),
                  ],
                ),
              ],
            ),
            const SpaceWH(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "To",
                  style: textstyle(15, FontWeight.normal, kBlack),
                ),
                Row(
                  children: [
                    Text("${provider.bookedSlots!.to!.day}"),
                    Text("/${provider.bookedSlots!.to!.month}"),
                    Text("/${provider.bookedSlots!.to!.year}"),
                    const SpaceWH(width: 10),
                    Text("${provider.bookedSlots!.to!.hour}"),
                    Text(":${provider.bookedSlots!.to!.minute}"),
                  ],
                ),
              ],
            ),
            const SpaceWH(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Drop off City",
                  style: textstyle(15, FontWeight.normal, kBlack),
                ),
                Row(
                  children: [
                    Text("${provider.dropoffCity}"),
                  ],
                ),
              ],
            ),
            const SpaceWH(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Booking Status",
                  style: textstyle(15, FontWeight.normal, kBlack),
                ),
                Row(
                  children: [
                    Text("${provider.transactionId}..."),
                  ],
                ),
              ],
            ),
            const SpaceWH(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total hours",
                  style: textstyle(15, FontWeight.normal, kBlack),
                ),
                Row(
                  children: [
                    Text("${provider.totalHours}"),
                  ],
                ),
              ],
            ),
            const SpaceWH(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total Amount",
                  style: textstyle(15, FontWeight.bold, kBlack),
                ),
                Row(
                  children: [
                    Text(
                      "${provider.totalAmount}",
                      style: textstyle(14, FontWeight.bold, kBlack),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(kBlack),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  log('${provider.transactionId}');
// Normal with stripe payments
                  payment.pay(
                      amount: provider.totalAmount.toString(),
                      context: context);
// Stripe payment with backend call
                  payment.payAmount(
                      amount: provider.totalAmount.toString(),
                      context: context);
                },
                child: const Text(
                  "Pay now",
                  style: TextStyle(color: blueButton),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                var items = [
                  {
                    "productPrice": 4,
                    "productName": "Apple",
                    "qty": 5,
                  },
                  {
                    "productPrice": 5,
                    "productName": "Pineapple",
                    "qty": 10,
                  },
                ];
                await PaymentsViewModel.stripePaymentCheckout(
                  items,
                  500,
                  context,
                  mounted,
                  onSuccess: () {
                    log("SUCCESS");
                  },
                  onCancel: () {
                    log("CANCEL");
                  },
                  onError: (e) {
                    log("ERROR:$e");
                  },
                );
              },
              child: const Text("Sample"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntents = await createPaymentIntent(amount, "INR");
      log("#############$paymentIntents");
      log("aaaaaaaaa");

      // await Stripe.instance.presentPaymentSheet(options: );

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntents!['client_secret'],
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
                  merchantDisplayName: "Ijas"))
          .then((value) {
        displayPaymentSheet();
      });

      log("bbbbbbbbbb");
      // displayPaymentSheet();
    } catch (e) {
      log("222222222");

      log(e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      log("Cccccccccc");

      await Stripe.instance.presentPaymentSheet().then((value) {
        log("SuccessFull");

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

        paymentIntents = null;
      }).onError((error, stackTrace) {
        log("6666666666");
        log("Error is : ---> $error $stackTrace");
      });
    } on StripeException catch (e) {
      log("77777777777");

      log("Error is ---> $e");
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text("Cancelled"),
        ),
      );
    } catch (e) {
      log("333333333333333");
      log(e.toString());
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      log("DDDDDDDDDDDDDDd");
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
        'receipt_email': 'ija@gamil.com'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${Urls.secret}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );

      log("Payment Intent");
      log(response.body.toString());

      return jsonDecode(response.body);
    } catch (e) {
      log("4444444444");

      log(e.toString());
    }
  }

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }
}
