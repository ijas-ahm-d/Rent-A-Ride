import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rent_a_ride/models/places/place_data_model.dart';
import 'package:rent_a_ride/repo/api_services.dart';
import 'package:rent_a_ride/repo/api_status.dart';
import 'package:rent_a_ride/utils/url.dart';

class PlacesViewModel extends ChangeNotifier {
  PlacesViewModel() {
    getAllPlaces();
    // notifyListeners();
  }
  List<PlaceDataModel> _placeDataList = [];
  List<PlaceDataModel> get placeDataList => _placeDataList;

  final List<String> _placeList = [];
  List<String> get placeList => _placeList;
  String? dropbutton;

  getDropValue() {
    dropbutton = _placeList.first;
    notifyListeners();
  }

  setDropDown(String value) {
    dropbutton = value;
    notifyListeners();
  }

  getPlaces() {
    for (var place in placeDataList) {
      placeList.add(place.place!);
    }
    log(placeList.toString());
  }

// LOADING
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setPlaceListData(List<PlaceDataModel> placeDataList) {
    _placeDataList = placeDataList;
    log("***Places ${_placeDataList.length}*******");
    notifyListeners();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  getAllPlaces() async {
    log("getAllPlaces");
    setLoading(true);
    String url = Urls.baseUrl + Urls.admin + Urls.getAllPlaces;
    final response = await ApiServices.getMEthod(
      url: url,
      function: placeDataModelFromJson,
    );
    log("get all places :1");
    if (response is Success) {
      log("Places on view model");
      await setPlaceListData(response.response as List<PlaceDataModel>);
      await getPlaces();
      getDropValue();
    }
    if (response is Failures) {
      log("places etheella");
      setLoading(false);
    }
    setLoading(false);
  }
}
