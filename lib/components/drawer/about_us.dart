import 'package:flutter/material.dart';
import 'package:rent_a_ride/components/common/common_appbar.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/images.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlack,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(
          title: "About Us",
          txtClr: kwhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
        child: Column(
          children: [
            Center(
              child: Container(
                height: size.width * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      Images.logo,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Welcome To RENT_MY_WHEELS",
                  style: textstyle(17, FontWeight.bold, kwhite),
                ),
              ),
            ),
            Center(
              child: Text(
                "A car rental, hire car or car hire agency is a company that rents automobiles for short periods of time to the public, generally ranging from a few hours to a few weeks. It is often organized with numerous local branches (which allow a user to return a vehicle to a different location), and primarily located near airports or busy city areas and often complemented by a website allowing online reservations.",
                textAlign: TextAlign.justify,
                style: textstyle(14, FontWeight.w500, grayText),
              ),
            ),
            const SpaceWH(height: 15),
            const AboutIconText(title: "Best Rental Car Service"),
            const AboutIconText(title: "Cars on Cheaper Price"),
            const AboutIconText(title: "Good Quality Cars"),
            const AboutIconText(title: "Best Service Providing Cars"),
            const SpaceWH(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "We are Committed To Provide Safe Ride Solutions",
                style: textstyle(14, FontWeight.w600, kwhite),
              ),
            ),
            Text(
              "We have a wide range of cars available, from pick-ups to premium models and everything in between. Our rental rules provide you with freedom, flexibility, and safety, which means that you can rent a car for as long as you like.",
              textAlign: TextAlign.justify,
              style: textstyle(15, FontWeight.w500, grayText),
            ),
            Text(
              "We prioritize our customer's needs which is why we provide them with a vast array of categories to choose from when renting a car.\nHere at Saferide, we provide our customers with a safe and efficient car rental service like no other.",
              textAlign: TextAlign.justify,
              style: textstyle(14, FontWeight.w500, grayText),
            ),
            TextButton(
                onPressed: () async {
                  const url =
                      'mailto:ijasahammed2000@gmail.com?subject=FeedBack &body=Hi,Rent a Ride';
                  Uri uri = Uri.parse(url);
                  await launchUrl(uri);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: blueButton,
                      size: 20,
                    ),
                    Text(
                      "CONTACT US",
                      style: textstyle(14, FontWeight.w500, kwhite),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class AboutIconText extends StatelessWidget {
  final String title;
  const AboutIconText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.file_download_done_rounded,
          color: blueButton,
        ),
        Text(
          title,
          style: textstyle(13, FontWeight.bold, kgrey),
        )
      ],
    );
  }
}
