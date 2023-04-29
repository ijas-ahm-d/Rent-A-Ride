import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/car_details/car_details.dart';
import 'package:rent_a_ride/view_model/cars/cars_view_model.dart';

class SingleCarDetails extends StatelessWidget {
  // final String image;
  const SingleCarDetails({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerCar = context.watch<CarsViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bodyColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: bodyColor,
              width: double.infinity,
              height: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SpaceWH(
                    height: 30,
                  ),
                  SizedBox(
                    height: size.width * 0.5,
                    width: size.width * 0.9,
                    child: Image.network(
                      providerCar.carsDataList[index].image!,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      providerCar.carsDataList[index].name
                          .toString()
                          .toUpperCase(),
                      style: GoogleFonts.baskervville(
                          color: kwhite,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          fontSize: size.width * 0.05,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                providerCar.carsDataList[index].description.toString(),
                style: headline6,
              ),
            ),
            const SpaceWH(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                carFeatures(
                  providerCar.carsDataList[index].transmission
                      .toString()
                      .toUpperCase(),
                  const Icon(
                    Icons.settings,
                    color: kwhite,
                  ),
                ),
                // carFeatures(
                //   "250km/h",
                //   const Icon(
                //     Icons.speed,
                //     color: kwhite,
                //   ),
                // ),
                carFeatures(
                  "${providerCar.carsDataList[index].model}",
                  const Icon(
                    Icons.settings,
                    color: kwhite,
                  ),
                ),
                carFeatures(
                  providerCar.carsDataList[index].fuel.toString().toUpperCase(),
                  const Icon(
                    Icons.charging_station_rounded,
                    color: kwhite,
                  ),
                ),
              ],
            ),
            // const Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(200, 40)),
                backgroundColor: const MaterialStatePropertyAll(blueButton),
                overlayColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CarDetailsScreen(
                        carData: providerCar.carsDataList,
                        index: index,
                      );
                    },
                  ),
                );
              },
              child: const Text("BOOK NOW"),
            ),
          ],
        ),
      ),
    );
  }

  Column carFeatures(String title, Icon icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          // width: 70,
          color: bodyColor,
          // height: 70,
          child: icon,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: headline3,
          ),
        )
      ],
    );
  }
}
