import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/car_details/booking_information/components/dropoff_date_time.dart';
import 'package:rent_a_ride/view/car_details/booking_information/components/footer_booking_information.dart';
import 'package:rent_a_ride/view/car_details/booking_information/components/pickup_date_time.dart';
import 'package:rent_a_ride/view_model/booking/booking_view_model.dart';
import 'package:rent_a_ride/view_model/places/places_view_model.dart';

class BookingInformations extends StatelessWidget {
  const BookingInformations({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final providerplaces = context.watch<PlacesViewModel>();
    final pBooking = context.watch<BookingViewModel>();

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Booking Information",
            style: titleCardName,
          ),
          const SpaceWH(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: 10),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: specialCard2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      prefixText: "DROP OF CITY : ",
                      prefixStyle: TextStyle(
                        color: grayText,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    dropdownColor: grayText,
                    value: providerplaces.dropbutton,
                    iconSize: 20,
                    elevation: 16,
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: kwhite,
                    ),
                    items: providerplaces.placeList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: textstyle(14, FontWeight.bold, kwhite),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      providerplaces.setDropDown(newValue!);
                    },
                  ),
                ),
                const SpaceWH(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  decoration: const BoxDecoration(
                    gradient: specialCard2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: CheckboxListTile(
                    checkColor: blueButton,
                    activeColor: kwhite,
                    title: Text(
                      'Do you need a Driver.?',
                      style: textstyle(14, FontWeight.bold, kwhite),
                    ),
                    value: pBooking.isDriverRequired,
                    onChanged: (value) {
                      pBooking.isDriver(value!);
                    },
                  ),
                ),
                const SpaceWH(height: 20),
                const PickUpDateTime(),
                const SpaceWH(height: 20),
                const DropOffDateTime(),
                const SpaceWH(height: 20),
                const FooterBoookingInfo(),
              ],
            ),
          ),
          const SpaceWH(height: 15),
        ],
      ),
    );
  }
}
