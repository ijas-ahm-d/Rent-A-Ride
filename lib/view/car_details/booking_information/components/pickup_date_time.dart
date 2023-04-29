import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view_model/booking/booking_view_model.dart';

class PickUpDateTime extends StatelessWidget {
  const PickUpDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "please select pickup date and time",
          style: textstyle(15, FontWeight.w500, blueButton),
        ),
        const SpaceWH(height: 5),
        Consumer<BookingViewModel>(
          builder: (context, value, child) {
            // final hours = value.pickupTime!.hour.toString().padLeft(2, '0');
            // final minutes = value.pickupTime!.minute.toString().padLeft(2, '0');
            // final day = value.pickupDate!.day.toString();
            // final month = value.pickupDate!.month.toString();
            // final year = value.pickupDate!.year.toString();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(5),
                  width: size.width * 0.4,
                  decoration: const BoxDecoration(gradient: specialCard2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SpaceWH(width: 3),
                      value.checkPickupDate(),
                      // Text(
                      //   value.checkPickupDate(),
                      //   style: textstyle(17, FontWeight.bold, kwhite),
                      // ),
                      IconButton(
                        onPressed: () async {
                          await value.getPickupDate(context);
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: kwhite,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(5),
                  width: size.width * 0.35,
                  decoration: const BoxDecoration(gradient: specialCard2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SpaceWH(width: 3),
                      value.checkPickupTime(),
                      // Text(
                      //   value.pickupTime == null
                      //       ? "Time"
                      //       : value.pickupTime!.hour.toString().padLeft(2, '0'),
                      //   style: textstyle(17, FontWeight.bold, kwhite),
                      // ),
                      IconButton(
                        onPressed: () async {
                          await value.getPickupTime(context);
                        },
                        icon: const Icon(
                          Icons.schedule,
                          color: kwhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
