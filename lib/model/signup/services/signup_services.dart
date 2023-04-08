import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:rent_a_ride/model/signup/signup_model.dart';
import 'package:rent_a_ride/utils/url.dart';
import 'package:rent_a_ride/view/otp/otp_screen.dart';
import 'package:rent_a_ride/view_model/signup/signup_provider.dart';

import '../../../utils/colors.dart';
import '../../../view/widgets/msgsnackbar.dart';

class SignUpService {
  Future signUpApiServices(
      {required BuildContext context,required signUpModel,required phoneNumber,required email, required fullName,required password}) async {
    // This widget is to show circular progress indicator
//  to the server is loading
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      ),
    );

    try {
      Response response = await Dio().post(
        Urls.baseUrl + Urls.user + Urls.userSignUp,
        data:signUpModel.toJson()
      );
      log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
// Clearing Textfields
        // Provider.of<SignupProvider>(context, listen: false)
        //     .nameController
        //     .clear();
        // Provider.of<SignupProvider>(context, listen: false)
        //     .passwordController
        //     .clear();
        // Provider.of<SignupProvider>(context, listen: false)
        //     .emailController
        //     .clear();
        // Provider.of<SignupProvider>(context, listen: false)
        //     .phoneNumberController
        //     .clear();
             Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OtpScreen(
                phoneNumber: phoneNumber,
                email: email,
                fullName: fullName,
                password: password,
                
              );
            },
          ),
        );
      } else if (response.statusCode == 409) {
        log("User already exist");
        return;
      } else if (response.statusCode == 400) {
        log("*****Server /dowm***********");
        return;
      } else if (response.statusCode == 503) {
        log("*****'Server Down,cant sent otp now'***********");
        return;
      } else if (response.statusCode == 500) {
        log("*****'Server Down***********");
        return;
      }  else {
        log("Error Occured");
        return;
      }
    } catch (error) {
      log(error.toString());
      if (error is DioError) {
        MsgSnackBAr().snackBar(
            color: snackbarwarn,
            context: context,
            data: "server down \n ${error.message.toString()}");
      } else {
          MsgSnackBAr()
            .snackBar(color: snackbarwarn, context: context, data: "$error");
      }
    }
  }


}
