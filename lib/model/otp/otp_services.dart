import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_ride/utils/url.dart';
import 'package:rent_a_ride/view/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpServices {
  /// OtpApiServices
  /// Use Dio to post the data to the API.
  /// get the mobile number from the textformfield and make and verify

  Future otpServices(
      {required fullName,
      required email,
      required password,
      required phoneNumber,
      required otpCode,
      required context}) async {

       //  Data for otp api
      var json = jsonEncode({
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "otpCode": otpCode,
      });  
    try {
     
      var response = await Dio().post(Urls.baseUrl + Urls.user+ Urls.userOtp,
          data: json, options: Options(contentType: "application/json"));

      if (response.statusCode == 201 || response.data==200) {
        // SHARED PREFERENCE OBJECT
        final prefs = await SharedPreferences.getInstance();
        // ACCESS TOKEN
        String accessToken = response.data['token'];
        prefs.setString("access_token", accessToken);

        // Login Or Not
        prefs.setBool("isLoggedIn", true);

        // LogOut
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else if (response.statusCode == 400) {
        // error Message
        log("oops!! Otp is Incorrect");
      }
    } on SocketException {
      Navigator.of(context).pop();
      log("No Internet");
    } on DioError catch (e) {
      // Handling Timeout error
      if (e.response == null) {
        log("something went wrong");
        Navigator.pop(context);
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
