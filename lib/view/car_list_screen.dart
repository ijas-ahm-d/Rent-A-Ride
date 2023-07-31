import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/all_cars/all_cars.dart';
import 'package:rent_a_ride/components/all_cars/brand_selection.dart';
import 'package:rent_a_ride/components/common/loading_card.dart';
import '../view_model/cars_view_model.dart';

class CarList extends StatelessWidget {
  const CarList({super.key});

  @override
  Widget build(BuildContext context) {
    final providerCar = context.watch<CarsViewModel>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const BrandSelection(),
          providerCar.isLoading
              ? Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: const LoadingCard(),),)
              :
               AllCars(
                  carData: providerCar.currentBrandIndex == 0
                      ? providerCar.carsDataList
                      : providerCar.currentBrandIndex == 1
                          ? providerCar.audiCarsList
                          : providerCar.currentBrandIndex == 2
                              ? providerCar.benzCarsList
                              : providerCar.currentBrandIndex == 3
                                  ? providerCar.miniCarsList
                                  : providerCar.bmwCarsList,
                ),
        ],
      ),
    );
  }
}
