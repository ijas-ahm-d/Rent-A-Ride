import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rent_a_ride/repo/api_status.dart';
import 'package:rent_a_ride/utils/url.dart';

class UserSignupServices {
  static Future signupUser(String url, Map data) async {
    try {
      String url = Urls.baseUrl + Urls.user + Urls.userSignUp;

      final response = await http.post(Uri.parse(url), body: data);
      log("-------------${response.statusCode}-----------------");
      if (response.statusCode == 201 || response.statusCode == 200) {
        log(response.body.toString());
        return Success();
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
      return Failures(code: 500, errrorResponse: "Unknown error");
    }
  }
}
