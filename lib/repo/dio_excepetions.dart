import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_ride/components/common_snackbar.dart';
import 'package:rent_a_ride/utils/colors.dart';

class DioExceptions {
  void dioError(Object e, BuildContext context) {
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        CommonSnackBAr().snackBar(
            context: context,
            data: "User already exists...",
            color: snackbarRed);
      }
      if (e.response?.statusCode == 403) {
        CommonSnackBAr().snackBar(
            context: context, data: "Invalid password", color: snackbarRed);
      }
      if (e.response?.statusCode == 400) {
        CommonSnackBAr().snackBar(
            context: context, data: "User not found", color: snackbarRed);
      }
      if (e is SocketException) {
        CommonSnackBAr().snackBar(
            context: context, data: "OOPS!! No Internet", color: snackbarRed);
      }
      if (e is FormatException) {
        
        CommonSnackBAr().snackBar(
            context: context, data: "Invalid Format", color: snackbarwarn);
      } else if (e is TimeoutException) {
        CommonSnackBAr().snackBar(
            context: context, data: "Connection Timeout", color: snackbarRed);
      }
    }
  }
}
