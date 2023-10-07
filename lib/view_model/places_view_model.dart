import 'package:flutter/material.dart';
import 'package:rent_a_ride/models/place_data_model.dart';
import 'package:rent_a_ride/repository/api_services.dart';
import 'package:rent_a_ride/repository/api_status.dart';
import 'package:rent_a_ride/utils/constant.dart';

class PlacesViewModel extends ChangeNotifier {
  PlacesViewModel() {
    getAllPlaces();
  }

  bool _isLoading = false;
  bool get isloading => _isLoading;

  List<PlaceDataModel> _placeDataList = [];
  List<PlaceDataModel> get placeDataList => _placeDataList;

  final List<String> _placeList = [];
  List<String> get placeList => _placeList;

  String? _dropbutton;
  String? get dropbutton => _dropbutton;

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setDropDown(String value) {
    _dropbutton = value;
    notifyListeners();
  }

  getDropValue() {
    _dropbutton = _placeList.first;
    notifyListeners();
  }

  getPlaces() {
    for (var place in placeDataList) {
      placeList.add(place.place!);
    }
  }

  setAllPlaceListData(List<PlaceDataModel> data) async {
    _placeDataList = data;
    notifyListeners();
  }

  getAllPlaces() async {
    setLoading(true);
    String url = Urls.baseUrl + Urls.admin + Urls.getAllPlaces;
    final response = await ApiServices.getMEthod(
      url: url,
      function: placeDataModelFromJson,
    );

    if (response is Success) {
      await setAllPlaceListData(response.response as List<PlaceDataModel>);
      await getPlaces();
      getDropValue();
    }
    if (response is Failures) {
      setLoading(false);
    }
    setLoading(false);
  }
}
