import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rent_a_ride/data/app_exceptions.dart';
import 'package:rent_a_ride/data/network/http_api_service.dart';
import 'package:rent_a_ride/utils/constant.dart';

class NetWorkApiServices extends HttpApiServices {
  @override
  Future<dynamic> httpGetMethod({
    required String url,
    bool haveHeader = false,
  }) async {
    final accessToken = await AccessToken.getAccessToken();
    Map<String, String> headers =
        haveHeader ? {"authorization": "Bearer $accessToken"} : {};

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: haveHeader ? headers : null,
      );
      final successResponse = returnResponse(response);
      return successResponse;
    } on SocketException {
      throw "No internet connection";
    }
  }

  @override
  Future<dynamic> httpPostMethod({
    required String url,
    bool haveHeader = false,
    required Map data,
  }) async {
    final accessToken = await AccessToken.getAccessToken();
    Map<String, String> headers =
        haveHeader ? {"authorization": "Bearer $accessToken"} : {};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: haveHeader ? headers : null,
        body: data,
      );
      final successResponse = returnResponse(response);
      return successResponse;
    } on SocketException {
      throw "No internet connection";
    }
  }

  returnResponse(Response response) {
    final jsonBody = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        log("1");
        return response.body;
      case 201:
        log("2");
        return response.body;
      case 400:
        log("3");
        throw BadRequestException(jsonBody["error"]);
      case 401:
        log("4");
        throw UnAuthorizedException(jsonBody["message"]);
      case 409:
        log("5");
        throw UnAuthorizedException(jsonBody["message"]);
      default:
        log("default");
        throw FetchDataException("Unknown error ${response.statusCode}");
    }
  }
}
