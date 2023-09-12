import 'package:flutter/material.dart';
import 'package:rent_a_ride/data/response/api_response.dart';
import 'package:rent_a_ride/models/place_data_model.dart';
import 'package:rent_a_ride/repository/all_places_repository.dart';
import 'package:rent_a_ride/utils/constants.dart';

class PlacesViewModel extends ChangeNotifier {
  PlacesViewModel() {
    getAllPlaces();
  }

  final _myRepo = AllPlacesRepository();

  ApiResponse<List<PlaceDataModel>> _placeDataList = ApiResponse.loading();
  ApiResponse<List<PlaceDataModel>> get placeDataList => _placeDataList;

  String? _dropbutton;
  String? get dropbutton => _dropbutton;

  setDropDown(String value) {
    _dropbutton = value;
    notifyListeners();
  }

  setAllPlaces(ApiResponse<List<PlaceDataModel>> data) async {
    _placeDataList = data;
    notifyListeners();
  }

  getAllPlaces() async {
    String url = Urls.baseUrl + Urls.admin + Urls.getAllPlaces;
    _myRepo
        .getAllPlaces(
          url: url,
        )
        .then(
          (value) => {
            setAllPlaces(
              ApiResponse.completed(value),
            )
          },
        )
        .onError(
          (error, stackTrace) => {
            setAllPlaces(
              ApiResponse.error(
                error.toString(),
              ),
            ),
          },
        );
  }
 
}
