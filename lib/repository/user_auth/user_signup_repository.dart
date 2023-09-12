import 'package:rent_a_ride/data/network/http_api_service.dart';
import 'package:rent_a_ride/data/network/network_api_service.dart';
import 'package:rent_a_ride/models/user_otp_model.dart';

class UserSignupRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future getUserSignup({
    required String url,
    required Map body,
  }) async {
    try {
      final response = await apiServices.httpPostMethod(url: url, data: body);
      return userOtpModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
