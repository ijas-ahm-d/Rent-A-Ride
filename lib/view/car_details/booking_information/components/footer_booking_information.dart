import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view_model/booking/booking_view_model.dart';

class FooterBoookingInfo extends StatelessWidget {
  const FooterBoookingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingViewModel>();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 12, 10, 12),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          decoration: BoxDecoration(
            // gradient: specialCard2,
            color: blueButton,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 7,
                spreadRadius: 0.5,
              )
            ],
          ),
          child: Text(
            provider.totalHors == null
                ? "Total Hours : 0"
                : "Total Hours : ${provider.totalHors}",
            style: textstyle(17, FontWeight.w500, kwhite),
          ),
        )
      ],
    );
  }
}
