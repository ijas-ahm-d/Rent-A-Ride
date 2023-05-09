import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/drawer/bookings/bookings_card.dart';
import 'package:rent_a_ride/components/common/common_appbar.dart';
import 'package:rent_a_ride/view_model/my_bookings_view_model.dart';

class UserBookings extends StatelessWidget {
  const UserBookings({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MyBookingsViewModel>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(210, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(title: "BOOKINGS"),
      ),
      body: ListView.builder(
        itemCount: provider.bookingList.length,
        itemBuilder: (context, index) {
          return BookingCard(index: index);
        },
      ),
    );
  }
}
