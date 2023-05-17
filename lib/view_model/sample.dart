import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rent_a_ride/repo/api_services.dart';
import 'package:rent_a_ride/repo/api_status.dart';
import 'package:rent_a_ride/utils/url.dart';

class Sample extends ChangeNotifier {
  Future<void> payAmount(context, amount) async {
    const url = "https://buy.stripe.com/test_9AQeVk0hBfVQ6Sk4gg";
    Map<String, String> headers = {
      'Authorization': 'Bearer ${Urls.secret}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    Map<String, dynamic> body = {
      'amount': calculateAmount(amount),
      'currency': "INR",
      'payment_method_types[]': 'card',
      // 'source': 'tok_visa',
    };
    final response = await ApiServices.postMethod(
      context: context,
      url: url,
      data: body,
      headers: headers,
    );
    if (response is Success) {
      log("success");
      log(response.response.toString());
    }
    if (response is Failures) {
      log("failed");
      log(response.responseMsg.toString());
    }
  }

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }
}
