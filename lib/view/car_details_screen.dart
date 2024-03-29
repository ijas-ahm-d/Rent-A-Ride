import 'package:flutter/material.dart';
import 'package:rent_a_ride/components/car_details/about_car.dart';
import 'package:rent_a_ride/components/car_details/car_header_section.dart';
import 'package:rent_a_ride/components/car_details/car_specifications.dart';
import 'package:rent_a_ride/models/cars_data_model.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/view/booking_information.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({
    super.key,
    required this.index,
    required this.carData,
  });
  final List<CarsDataModel> carData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 49, 92),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
// TOP SECTION
            CarHeaderSection(
              carName: carData[index].name.toString(),
              image: carData[index].image.toString(),
              model: carData[index].model.toString(),
              size: size,
            ),
            const SpaceWH(height: 20),
// CAR SPECIFICATION SECTION
            CarSpecifications(
              carData: carData,
              index: index,
            ),
//CAR DESCRIPTION SECTION AND PLACE
            AboutCar(
              details: carData[index].description.toString(),
              place: carData[index].place.toString(),
            ),
// Booking Section
            BookingInformations(
              index: index,
             
            ),
          ],
        ),
      ),
    );
  }
}
