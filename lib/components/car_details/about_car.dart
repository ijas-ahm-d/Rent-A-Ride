import 'package:flutter/material.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';

class AboutCar extends StatelessWidget {
  const AboutCar({super.key, required this.details, required this.place});
  final String details;
  final String place;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About",
                style: titleCardName,
              ),
              const SpaceWH(height: 10),
              Text(
                details,
                style: textstyle(
                  15,
                  FontWeight.w400,
                  grayText,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: titleCardName,
              ),
              const SpaceWH(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: snackbarRed,
                  ),
                  const SpaceWH(
                    width: 10,
                  ),
                  Text(
                    place,
                    style: textstyle(
                      15,
                      FontWeight.w600,
                      kBlack,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const Divider(thickness: 2)
      ],
    );
  }
}
