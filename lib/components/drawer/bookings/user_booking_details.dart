import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view_model/my_bookings_view_model.dart';
import 'package:intl/intl.dart';

class UserBookingDetails extends StatelessWidget {
  const UserBookingDetails({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<MyBookingsViewModel>();
    DateTime pickUp =
        DateTime.parse(provider.bookingList[index].bookedSlots!.from!);
    String pickUpMonth = DateFormat.MMM().format(pickUp);
    String pickUpTime = DateFormat('h:mm a').format(pickUp);

    DateTime dropOff =
        DateTime.parse(provider.bookingList[index].bookedSlots!.to!);

    String dropOffMonth = DateFormat.MMM().format(dropOff);
    String dropOFfTime = DateFormat('h:mm a').format(dropOff);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 49, 92),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 49, 92),
        elevation: 0,
        title: Text(
          "Booking Details",
          style: textstyle(
            17,
            FontWeight.bold,
            kwhite,
          ),
        ),
        leading: const BackButton(
          color: kwhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.width * 0.39,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                      ),
                      color: kwhite,
                    ),
                    height: size.height,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 50,
              left: 50,
              right: 50,
              child: SizedBox(
                width: 200,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      child: Image.network(
                        provider.bookingList[index].carData![0].image!,
                        width: 250,
                      ),
                    ),
                    const SpaceWH(height: 10),
                    Text(
                      provider.bookingList[index].carData![0].name ??
                          "CAR NAME",
                      style: textstyle(
                        18,
                        FontWeight.bold,
                        kBlack,
                      ),
                    ),
                    const SpaceWH(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "PICK UP DATE",
                          style: hintStyle,
                        ),
                        Text(
                          "${pickUp.day}-$pickUpMonth-${pickUp.year}",
                          style: textstyle(15, FontWeight.w600, kBlack),
                        ),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "PICK UP TIME",
                          style: hintStyle,
                        ),
                        Text(
                          pickUpTime,
                          style: textstyle(15, FontWeight.w600, kBlack),
                        ),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "DROP OFF DATE",
                          style: hintStyle,
                        ),
                        Text(
                          "${dropOff.day}-$dropOffMonth-${dropOff.year}",
                          style: textstyle(15, FontWeight.w600, kBlack),
                        ),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "DROP OFF TIME",
                          style: hintStyle,
                        ),
                        Text(
                          dropOFfTime,
                          style: textstyle(15, FontWeight.w600, kBlack),
                        ),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "DRIVER",
                          style: hintStyle,
                        ),
                        const SpaceWH(width: 20),
                        Text(
                          provider.bookingList[index].driverRequire!
                              ? "REQUIRED"
                              : "NOT REQUIRED",
                          style: textstyle(15, FontWeight.w600, kBlack),
                        ),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "DROP OFF CITY",
                          style: hintStyle,
                        ),
                        const SpaceWH(width: 20),
                        Text(
                          provider.bookingList[index].dropoffCity ?? "PLACE",
                          style: textstyle(15, FontWeight.w600, kBlack),
                        ),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "TOTAL HOURS",
                          style: hintStyle,
                        ),
                        const SpaceWH(width: 20),
                        Text(
                          provider.bookingList[index].totalHours ?? "00",
                          style: textstyle(15, FontWeight.w600, kBlack),
                        ),
                      ],
                    ),
                    const SpaceWH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "TOTAL AMOUNT",
                          style: hintStyle,
                        ),
                        const SpaceWH(width: 20),
                        Text(
                          provider.bookingList[index].totalAmount ?? "00",
                          style: textstyle(15, FontWeight.w600, kBlack),
                        ),
                      ],
                    ),
                    const SpaceWH(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "PAYMENT",
                          style: hintStyle,
                        ),
                        const SpaceWH(width: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration:
                              const BoxDecoration(gradient: specialCard2),
                          child: Text(
                            provider.bookingList[index].transactionId
                                .toString()
                                .toUpperCase(),
                            style: textstyle(14, FontWeight.w400, kwhite),
                          ),
                        ),
                      ],
                    ),
                    const SpaceWH(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "STATUS",
                          style: hintStyle,
                        ),
                        const SpaceWH(width: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration:
                              const BoxDecoration(gradient: specialCard2),
                          child: Text(
                            provider.bookingList[index].status
                                .toString()
                                .toUpperCase(),
                            style: textstyle(14, FontWeight.w400, kwhite),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
