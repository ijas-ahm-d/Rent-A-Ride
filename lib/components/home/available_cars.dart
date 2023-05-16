import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/car_details/car_details.dart';
import 'package:rent_a_ride/view/car_list/car_list.dart';
import 'package:rent_a_ride/view_model/cars_view_model.dart';

class AvailableCars extends StatelessWidget {
  final List images = [
    "assets/images/car1.png",
    "assets/images/car2.png",
    "assets/images/car3.png",
    "assets/images/carOtp.png",
  ];
  AvailableCars({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final providerCar = context.watch<CarsViewModel>();
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 0, 10),
      child: Column(
        children: [
          Row(
            children: [
              Text("Available Cars", style: titleCardName),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CarList(),
                    ),
                  );
                },
                child: const Text(
                  "See more.",
                  style: TextStyle(color: blueButton),
                ),
              ),
              const SpaceWH(width: 10),
            ],
          ),
          SizedBox(
            height: size.height * 0.28,
            child: Row(
              children: [
                providerCar.isLoading
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisExtent: size.width * 0.47,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return const Card(
                              child:  CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: size.width * 0.50,
            width: size.width * 0.40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      providerCar.carsDataList[index].name
                          .toString()
                          .toUpperCase(),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: textstyle(
                        17,
                        FontWeight.w600,
                        kBlack,
                      ),
                    ),
                  ),
                  const SpaceWH(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: snackbarRed,
                        size: 20,
                      ),
                      Text(
                        "${providerCar.carsDataList[index].place}",
                        maxLines: 1,
                        style: textstyle(
                          13,
                          FontWeight.w400,
                          grayText,
                        ),
                      ),
                    ],
                  ),
                  const SpaceWH(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.radio_button_checked,
                            color: kBlack,
                            size: 20,
                          ),
                          Text(
                            providerCar.carsDataList[index].rent.toString(),
                            style: textstyle(
                              14,
                              FontWeight.w500,
                              kBlack,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.radio_button_checked,
                            color: kBlack,
                            size: 20,
                          ),
                          Text(
                            "${providerCar.carsDataList[index].model}",
                            maxLines: 1,
                            style: textstyle(
                              14,
                              FontWeight.w600,
                              grayText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SpaceWH(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
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
                    child: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        color: blueButton,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "BOOK NOW",
                          style: textstyle(13, FontWeight.w500, kwhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 5,
          child: providerCar.isLoading
              ? const CircularProgressIndicator(
                  strokeWidth: 2,
                )
              : Column(
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
