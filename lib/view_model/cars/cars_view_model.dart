import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rent_a_ride/models/cars/cars_data_model.dart';
import 'package:rent_a_ride/repo/api_services.dart';
import 'package:rent_a_ride/repo/api_status.dart';
import 'package:rent_a_ride/utils/url.dart';

class CarsViewModel extends ChangeNotifier {
  CarsViewModel() {
    getAllCars();
    // notifyListeners();
  }
  final List<String> _placelist = [];
  List<String> get placeslist => _placelist;

  int _currentBrandIndex = 0;
  int get currentBrandIndex => _currentBrandIndex;

  void setBrandIndex(int currentIndex) {
    _currentBrandIndex = currentIndex;
    notifyListeners();
  }

  // CarsDataModel variable
  List<CarDataModel> _carsDataList = [];
  List<CarDataModel> get carsDataList => _carsDataList;

  // AUDI Cars variable
  List<CarDataModel> _audiCarsList = [];
  List<CarDataModel> get audiCarsList => _audiCarsList;

  // Benz Cars variable
  List<CarDataModel> _benzCarsList = [];
  List<CarDataModel> get benzCarsList => _benzCarsList;

// BMW Cars variable
  List<CarDataModel> _bmwCarsList = [];
  List<CarDataModel> get bmwCarsList => _bmwCarsList;

// MINI Cars variable
  List<CarDataModel> _miniCarsList = [];
  List<CarDataModel> get miniCarsList => _miniCarsList;

// LOADING
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setPlaceList(List<String> places) {
    notifyListeners();
  }

  //assign the data to show in UI
  setcarsListData(List<CarDataModel> carsDataList) {
    _carsDataList = carsDataList;
    notifyListeners();
  }

  setAudiCarList(List<CarDataModel> audicarsList) {
    _audiCarsList = audicarsList;
    notifyListeners();
  }

  setBenzCarList(List<CarDataModel> benzCarsList) {
    _benzCarsList = benzCarsList;
    notifyListeners();
  }

  setBmwCarList(List<CarDataModel> bmwCarsList) {
    _bmwCarsList = bmwCarsList;
    notifyListeners();
  }

  setMiniCarList(List<CarDataModel> miniCarsList) {
    _miniCarsList = miniCarsList;
    notifyListeners();
  }

// MAIN FUNCTION
  getAllCars() async {
    setLoading(true);
    log("getAllCars");
    String url = Urls.baseUrl + Urls.user + Urls.showAllCars;
    final response = await ApiServices.getMEthod(
      url: url,
      function: carDataModelFromJson,
    );
    if (response is Success) {
      log("Cars on viewModel");
      if (response.response != null) {
        setcarsListData(response.response as List<CarDataModel>);
        List<CarDataModel> places = [];
        List<CarDataModel> audiCars = [];
        List<CarDataModel> bmwCars = [];
        List<CarDataModel> miniCars = [];
        List<CarDataModel> benzCars = [];
        for (var element in carsDataList) {
          if (element.brand!.contains("AUDI")) {
            audiCars.add(element);
          } else if (element.brand!.contains("BMW")) {
            bmwCars.add(element);
          } else if (element.brand!.contains("MINI")) {
            miniCars.add(element);
          } else if (element.brand!.contains("MERCEDES BENZ")) {
            benzCars.add(element);
          }
          places.add(element);
          // setPlaceList(places );
          setAudiCarList(audiCars);
          setBmwCarList(bmwCars);
          setMiniCarList(miniCars);
          setBenzCarList(benzCars);
        }
        // log("AUDI CARS:${audiCars.length}");
        // log("BMW CARS:${audiCars.length}");
        // log("MINI CARS:${audiCars.length}");
        // log("Benz CARS:${audiCars.length}");
      }
    }
    if (response is Failures) {
      await setLoading(false);
    }
    setLoading(false);
  }
}
