import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_ride/utils/colors.dart';

class HomeBestOffers extends StatelessWidget {
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
  HomeBestOffers({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          return Stack(
            children: [
              Positioned(
                left: size.width * 0.02,
                top: size.width * 0.03,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: bodyColor,
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
                top: size.width * 0.20,
                right: size.width * 0.05,
                child: SizedBox(
                  child: Image.asset(
                    images[index],
                    width: size.width * 0.8,
                  ),
                ),
              ),
              Positioned(
                left: size.width * 0.07,
                top: size.width * 0.06,
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
                left: size.width * 0.07,
                top: size.width * 0.13,
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
          );
          // OfferCard(
          //   carName: carNAme[index],
          //   size: size,
          //   images: images[index],
          //   offer: offer[index],
          // );
        },
      ),
    );
  }
}
