import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_ride/utils/colors.dart';

class HomeDriverAds extends StatelessWidget {
  const HomeDriverAds({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // color: Colors.amber,
      height: size.height * 0.28,
      child: Stack(
        children: [
          Positioned(
            //  left: size.width * 0.02,
            //       top: size.width * 0.03,
            child: Container(
              margin: const EdgeInsets.all(4),
              width: size.height * 0.37,
              height: size.height * 0.27,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kwhite,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black38,
                    )
                  ]),
            ),
          ),
          Positioned(
            bottom: size.width * 0.05,
            right: size.width * 0.05,
            // right: 0,
            // bottom: 10,
            child: SizedBox(
              child: Image.asset(
                "assets/images/carDrivers.png",
                height: size.width * 0.5,
                width: size.width * 0.7,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Do you want to earn with us?",
                    style: GoogleFonts.baskervville(
                      color: kBlack,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "so don't be late!",
                    style: GoogleFonts.roboto(
                      color: hashColor,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(blueButton),
                    overlayColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  // style: ButtonStyle(
                  //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //       RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(18.0),
                  //         side: const BorderSide(color: Colors.red),
                  //       ),
                  //     ),
                  //     backgroundColor:const MaterialStatePropertyAll(snackbarRed)),
                  onPressed: () {},
                  child: const Text("BECOME A DRIVER"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
