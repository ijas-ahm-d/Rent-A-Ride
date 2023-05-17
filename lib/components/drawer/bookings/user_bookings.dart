import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/common/loading_card.dart';
import 'package:rent_a_ride/components/drawer/bookings/bookings_card.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view_model/my_bookings_view_model.dart';

class UserBookings extends StatelessWidget {
  const UserBookings({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MyBookingsViewModel>();
    return Scaffold(
      backgroundColor: kBlack.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: kwhite,
        leading: const BackButton(color: kBlack),
        title: Text(
          "Bookings",
          style: textstyle(
            16,
            FontWeight.w700,
            kBlack,
          ),
        ),
      ),
      body: provider.isLoading
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: const LoadingCard(),
            )
          : ListView.builder(
              itemCount: provider.bookingList.length,
              itemBuilder: (context, index) {
                return BookingCard(index: index);
              },
            ),
    );
  }
}
