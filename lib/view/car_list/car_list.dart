import 'package:flutter/material.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/view/home/widgets/home_available_cars.dart';

class CarList extends StatelessWidget {
  final List images = [
    "assets/images/car1.png",
    "assets/images/car2.png",
    "assets/images/car3.png",
    "assets/images/carOtp.png",
    "assets/images/car2.png",
    "assets/images/car3.png",
    "assets/images/car3.png",
    "assets/images/carOtp.png",
    "assets/images/car2.png",
    "assets/images/car1.png",
  ];
  CarList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bodyColor,
        title: const Text("ALL CARS"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: size.width * 0.65,
              childAspectRatio: 0.85,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: InkWell(
                onTap: () {},
                child: CarCard(
                  size: size,
                  images: images[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
