// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rent_a_ride/components/common_snackbar.dart';
// import 'package:rent_a_ride/models/user_otp_model.dart';
// import 'package:rent_a_ride/repo/api_services.dart';
// import 'package:rent_a_ride/repo/api_status.dart';
// import 'package:rent_a_ride/utils/colors.dart';
// import 'package:rent_a_ride/utils/url.dart';
// import 'package:rent_a_ride/view/home/home_screen.dart';
// import 'package:rent_a_ride/view_model/user_signup_view_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // class UserOtpViewModel with ChangeNotifier {
//   //  Controllers
//   final otpController1 = TextEditingController();

//   final otpFormKey = GlobalKey<FormState>();

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   UserOtpModel? _userData;
//   UserOtpModel get userData => _userData!;

//   OtpError? _otpError;
//   OtpError get otpError => _otpError!;

//   // Function to know it is loading
//   setLoading(bool loading) async {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   Future<UserOtpModel?> setUserData(UserOtpModel userData) async {
//     _userData = userData;
//     return _userData;
//   }

//   setOtpError(OtpError otpError, context) async {
//     _otpError = otpError;
//     return errorResponses(_otpError!, context);
//   }













// // OTP FUNCTION //
//   getOtpStatus(BuildContext context) async {
//     final navigator = Navigator.of(context);
//     setLoading(true);
//     String url = Urls.baseUrl + Urls.user + Urls.userOtp;
//     final response = await ApiServices.postMethod(
//       url,
//       userDataBody(context),
//       context,
//       userOtpModelFromJson,
//     );

//     // Success
//     if (response is Success) {
//       final data = await setUserData(response.response as UserOtpModel);
//       final accessToken = data!.token;

//       setLoginStatus(accessToken!);
//       navigator.pushAndRemoveUntil(MaterialPageRoute(
//         builder: (context) {
//           return HomeScreen();
//         },
//       ), (route) => false);
//     }
//     // Failure
//     if (response is Failures) {
//       await setLoading(false);
//       OtpError otpError = OtpError(
//         code: response.code,
//         message: response.errrorResponse,
//       );
//       await setOtpError(otpError, context);
//     }

//     setLoading(false);
//   }

//   // save the value of access token and make sure the user already login or not
//   setLoginStatus(String accessToken) async {
//     final status = await SharedPreferences.getInstance();
//     await status.setBool("isLoggedIn", true);
//     await status.setString("ACCESS_TOKEN", accessToken);
//   }

//   // The body to pass in the method
//   Map<String, dynamic> userDataBody(context) {
//     final value = Provider.of<UserSignupViewModel>(context, listen: false);
//     final body = UserOtpModel(
//       otpCode: otpController1.text.trim(),
//       fullName: value.nameController.text.trim(),
//       email: value.emailController.text.trim(),
//       phoneNumber: value.phoneNumberController.text.trim(),
//       password: value.passwordController.text.trim(),
//     );
//     return body.toJson();
//   }

//   clearControllers(context) {
//     final value = Provider.of<UserSignupViewModel>(context,listen: false);
//     otpController1.clear();
//     value.nameController.clear();
//     value.emailController.clear();
//     value.phoneNumberController.clear();
//     value.passwordController.clear();
//   }

//   otpButton(context)async {
//    await getOtpStatus(context);
//     clearControllers(context);
//   }

//   // Error  Responses
//   errorResponses(OtpError otpError, BuildContext context) {
//     final statusCode = otpError.code;
//     if (statusCode == 400 || statusCode == 408) {
//       return CommonSnackBAr().snackBar(
//         context: context,
//         data: "Invalid Otp",
//         color: snackbarRed,
//       );
//     }
//     return CommonSnackBAr().snackBar(
//       context: context,
//       data: "No Internet connection",
//       color: snackbarRed,
//     );
//   }
// }

// class OtpError {
//   int? code;
//   Object? message;

//   OtpError({
//     this.code,
//     this.message,
//   });
// }
