
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
class OfferCard extends StatelessWidget {
  const OfferCard(
      {super.key,
      required this.size,
      required this.images,
      required this.offer,
      required this.carName});

  final Size size;
  final String images;
  final String offer;
  final String carName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: size.width * 0.02,
          top: size.width * 0.03,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: bodyColor,
            ),
            height: size.height * 0.25,
            width: size.height * 0.37,
          ),
        ),
        Positioned(
          top: size.width * 0.20,
          right: size.width * 0.05,
          // top: size.width * 0.11,
          child: SizedBox(
            child: Image.asset(
              images,
              width: size.width * 0.8,
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.07,
          top: size.width * 0.06,
          child: Text(
            carName,
            style: GoogleFonts.baskervville(
              color: kwhite,
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
                "$offer OFF",
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
  }
}