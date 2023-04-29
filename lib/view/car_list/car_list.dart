import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rent_a_ride/view/car_list/components/all_cars.dart';
import 'package:rent_a_ride/view/car_list/components/brand_selection.dart';

import '../../view_model/cars/cars_view_model.dart';

TextEditingController helo = TextEditingController();

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
          BrandSelection(),
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
