import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';

class SingleCarDetails extends StatelessWidget {
  final String image;
  const SingleCarDetails({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bodyColor,
        elevation: 0,
      ),
      body: Column(
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
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "BUGATTI CHIRON",
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
              '''Hummer Jeep is a prestidge car with transcended driving traits. Apart from being to expensive for  enthusiasts, The hummer Jeep is iconic for its two plus four seaters is as immersive as it is versatile.''',
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
                "AUTOMATIC",
                const Icon(
                  Icons.settings,
                  color: kwhite,
                ),
              ),
              carFeatures(
                "250km/h",
                const Icon(
                  Icons.speed,
                  color: kwhite,
                ),
              ),
              carFeatures(
                "2021",
                const Icon(
                  Icons.settings,
                  color: kwhite,
                ),
              ),
              carFeatures(
                "PETROL",
                const Icon(
                  Icons.charging_station_rounded,
                  color: kwhite,
                ),
              ),
            ],
          ),
          const Spacer(),
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
              onPressed: () {},
              child: const Text("BOOK NOW")),
          SpaceWH(
            height: size.width * 0.3,
          )
        ],
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
