import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rent_a_ride/models/cars_data_model.dart';
import 'package:rent_a_ride/repo/api_services.dart';
import 'package:rent_a_ride/repo/api_status.dart';
import 'package:rent_a_ride/utils/url.dart';

class CarsViewModel extends ChangeNotifier {
  CarsViewModel() {
    getAllCars();
  }

  int _currentBrandIndex = 0;
  int get currentBrandIndex => _currentBrandIndex;

  void setBrandIndex(int currentIndex) {
    _currentBrandIndex = currentIndex;
    notifyListeners();
  }

  // CarsDataModel variable
  List<CarsDataModel> _carsDataList = [];
  List<CarsDataModel> get carsDataList => _carsDataList;

  // AUDI Cars variable
  List<CarsDataModel> _audiCarsList = [];
  List<CarsDataModel> get audiCarsList => _audiCarsList;

  // Benz Cars variable
  List<CarsDataModel> _benzCarsList = [];
  List<CarsDataModel> get benzCarsList => _benzCarsList;

// BMW Cars variable
  List<CarsDataModel> _bmwCarsList = [];
  List<CarsDataModel> get bmwCarsList => _bmwCarsList;

// MINI Cars variable
  List<CarsDataModel> _miniCarsList = [];
  List<CarsDataModel> get miniCarsList => _miniCarsList;

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

  setcarsListData(List<CarsDataModel> carsDataList) {
    _carsDataList = carsDataList;
    log(carsDataList.length.toString());
    notifyListeners();
  }

  setAudiCarList(List<CarsDataModel> audicarsList) {
    _audiCarsList = audicarsList;
    notifyListeners();
  }

  setBenzCarList(List<CarsDataModel> benzCarsList) {
    _benzCarsList = benzCarsList;
    notifyListeners();
  }

  setBmwCarList(List<CarsDataModel> bmwCarsList) {
    _bmwCarsList = bmwCarsList;
    notifyListeners();
  }

  setMiniCarList(List<CarsDataModel> miniCarsList) {
    _miniCarsList = miniCarsList;
    notifyListeners();
  }

// MAIN FUNCTION
  getAllCars() async {
    setLoading(true);
    log("getAllCars");
    String url = Urls.baseUrl + Urls.user + Urls.showAllCars;
    final response = await ApiServices.getMEthod(
     url:  url,
    function:   carsDataModelFromJson,
    );
    if (response is Success) {
      // log(response.response.toString());
      log("Cars on viewModel");
      if (response.response != null) {
        setcarsListData(response.response as List<CarsDataModel>);
        List<CarsDataModel> places = [];
        List<CarsDataModel> audiCars = [];
        List<CarsDataModel> bmwCars = [];
        List<CarsDataModel> miniCars = [];
        List<CarsDataModel> benzCars = [];
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
        log("AUDI CARS:${audiCars.length}");
        log("BMW CARS:${audiCars.length}");
        log("MINI CARS:${audiCars.length}");
        log("Benz CARS:${audiCars.length}");
      }
    }
    if (response is Failures) {
      log("cars not found");
      await setLoading(false);
    }
    setLoading(false);
  }
}
