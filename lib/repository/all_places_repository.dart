import 'package:rent_a_ride/data/network/http_api_service.dart';
import 'package:rent_a_ride/data/network/network_api_service.dart';
import 'package:rent_a_ride/models/place_data_model.dart';

class AllPlacesRepository {
  HttpApiServices apiServices = NetWorkApiServices();

  Future getAllPlaces({required String url}) async {
    try {
      final response = await apiServices.httpGetMethod(url: url);
      return placeDataModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
