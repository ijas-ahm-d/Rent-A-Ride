import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/view/car_details/car_details.dart';
import 'package:rent_a_ride/view/single_car/single_car.dart';
import 'package:rent_a_ride/view_model/cars/cars_view_model.dart';

class HomeAvailbleCars extends StatelessWidget {
  final List images = [
    "assets/images/car1.png",
    "assets/images/car2.png",
    "assets/images/car3.png",
    "assets/images/carOtp.png",
  ];
  HomeAvailbleCars({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final providerCar = context.watch<CarsViewModel>();
    return SizedBox(
      height: size.height * 0.28,
      child: Row(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: size.width * 0.47,
              ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: providerCar.carsDataList.length > 4
                  ? 4
                  : providerCar.carsDataList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CarCard(
                    index: index,
                    size: size,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.size,
    required this.index,
  });

  final Size size;
  final int index;
  @override
  Widget build(BuildContext context) {
    final providerCar = context.watch<CarsViewModel>();
    return Stack(
      children: [
        Positioned(
          bottom: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kwhite,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black38,
                  )
                ]),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: size.width * 0.50,
            width: size.width * 0.40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    providerCar.carsDataList[index].name
                        .toString()
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: GoogleFonts.baskervville(
                      color: bodyColor,
                      fontWeight: FontWeight.w900,
                      fontSize: size.width * 0.040,
                    ),
                  ),
                  const SpaceWH(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "${providerCar.carsDataList[index].rent}/Hour",
                      maxLines: 1,
                      style: GoogleFonts.albertSans(
                        color: bodyColor,
                        fontWeight: FontWeight.w900,
                        fontSize: size.width * 0.040,
                      ),
                    ),
                  ),
                  const SpaceWH(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.local_taxi),
                          Text(providerCar.carsDataList[index].model.toString())
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.settings),
                          Text(providerCar.carsDataList[index].transmission
                              .toString()
                              .toUpperCase())
                        ],
                      ),
                    ],
                  ),
                  const SpaceWH(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 249, 168, 38),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return CarDetailsScreen(
                                carData: providerCar.carsDataList,
                                index: index,
                              );
                            },
                          ));
                        },
                        child: const Text("Rent"),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 0, 13, 107),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return SingleCarDetails(
                                index: index,
                                // image: images,
                              );
                            },
                          ));
                        },
                        child: const Text("Details"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 5,
          child: Column(
            children: [
              SizedBox(
                child: Image.network(
                  providerCar.carsDataList[index].image!,
                  width: size.width * 0.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
