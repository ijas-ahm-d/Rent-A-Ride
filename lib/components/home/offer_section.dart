import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/view/car_list/car_list.dart';

class OfferSection extends StatelessWidget {
  final List images = [
    "assets/images/car1.png",
    "assets/images/car2.png",
    "assets/images/car3.png",
  ];

  final List offer = [
    "10%",
    "40%",
    "5%",
  ];
  final List carNAme = [
    "Audi",
    "BROCHURES GUIDES MAZDA",
    "BUGATTI CHIRON ",
  ];
  OfferSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
            ),
            color: blueButton,
          ),
          height: size.height * 0.15,
        ),
        SizedBox(
          height: size.height * 0.30,
          child: Swiper(
            pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                  color: kBlack, activeColor: blueButton),
            ),
            autoplay: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CarList();
                      },
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Positioned(
                      left: size.width * 0.07,
                      bottom: size.width * 0.09,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kwhite,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.black38,
                              )
                            ]),
                        height: size.height * 0.25,
                        width: size.height * 0.37,
                      ),
                    ),
                    Positioned(
                      bottom: size.width * 0.05,
                      right: size.width * 0.05,
                      child: SizedBox(
                        child: Image.asset(
                          images[index],
                          width: size.width * 0.8,
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.10,
                      bottom: size.width * 0.56,
                      child: Text(
                        carNAme[index],
                        style: GoogleFonts.baskervville(
                          color: bodyColor,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.10,
                      bottom: size.width * 0.44,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Need Some More",
                            style: GoogleFonts.roboto(
                              color: hashColor,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              fontSize: size.width * 0.04,
                            ),
                          ),
                          Text(
                            "${offer[index]} OFF",
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 53, 194, 193),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: size.width * 0.075,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
