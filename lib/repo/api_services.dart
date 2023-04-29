import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_status.dart';

class ApiServices {
  // POST METHOD
  static Future<Object> postMethod(
      String url, Map data, context, Function function) async {
    try {
      final response = await http.post(Uri.parse(url), body: data);
      log("-------------${response.statusCode}-----------------");
      if (response.statusCode == 201 || response.statusCode == 200) {
        log("finisheddddddddddddddd");
        log(response.body.toString());
        return Success(response: function(response.body));
      }
      return Failures(
          code: response.statusCode, errrorResponse: "Invalid Response");
    } on HttpException {
      log("HELOOO ");
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());
      return Failures(code: 500, errrorResponse: "UNKnown error");
    }
  }

  //GET METHOD
  static Future getMEthod(
      {required String url, required Function function}) async {
    try {
       log("get function:22");
      final response = await http.get(Uri.parse(url));
      log("get function:33");

      log("******${response.statusCode}******");
      if (response.statusCode == 200 || response.statusCode == 201) {

        return Success(response: function(response.body));
      }
      return Failures(
          code: response.statusCode, responseMsg: "Invalid response");
    } on HttpException {
      log("HELOOO ");
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());
      return Failures(code: 500, errrorResponse: "UNKnown error");
    }
  }
}
