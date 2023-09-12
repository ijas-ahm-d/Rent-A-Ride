import 'package:rent_a_ride/data/network/http_api_service.dart';
import 'package:rent_a_ride/data/network/network_api_service.dart';
import 'package:rent_a_ride/models/user_login_model.dart';

class UserLoginRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future getUserLogin({required String url, required Map body}) async {
    try {
      final response = await apiServices.httpPostMethod(url: url, data: body);
      return userLoginModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}
