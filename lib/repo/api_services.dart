import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_status.dart';

class ApiServices {
  static Future<Object> postMethod(
      String url, Map data, context, Function function) async {
    try {
      final response = await http.post(Uri.parse(url), body: data);
      log("-------------${response.statusCode}-----------------");
      if (response.statusCode == 201 || response.statusCode == 200) {
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
      return Failures(code: 103, errrorResponse: "UNKnown error");
    }

    //  on DioError catch (e) {
    //   DioExceptions().dioError(e, context);
    // } on FormatException catch (e) {
    //   log(e.message.toString());
    // }
  }
}
