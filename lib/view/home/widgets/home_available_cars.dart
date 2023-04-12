import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/view/single_car/single_car.dart';

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
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CarCard(
                    size: size,
                    images: images[index],
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
    required this.images,
  });

  final Size size;
  final String images;

  @override
  Widget build(BuildContext context) {
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
                    "BUGATTI CHIRON",
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
                      "650/Hour",
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
                        children: const [Icon(Icons.local_taxi), Text("2021")],
                      ),
                      Row(
                        children: const [Icon(Icons.settings), Text("AUTO")],
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
                              return SingleCarDetails(
                                image: images,
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
                                image: images,
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
                child: Image.asset(
                  images,
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
