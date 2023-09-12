import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/data/response/staus.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/components/booking/dropoff_date_time.dart';
import 'package:rent_a_ride/components/booking/footer_booking_information.dart';
import 'package:rent_a_ride/components/booking/pickup_date_time.dart';
import 'package:rent_a_ride/view_model/booking_view_model.dart';
import 'package:rent_a_ride/view_model/places_view_model.dart';

class BookingInformations extends StatelessWidget {
  const BookingInformations({
    super.key,
    required this.index
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  child: Consumer<PlacesViewModel>(
                    builder: (context, value, child) {
                      switch (value.placeDataList.status) {
                        case Status.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case Status.error:
                          return const Text("No Internet connection");
                        case Status.completed:
                          final placesList = value.placeDataList.data!;
                          return DropdownButtonFormField<String>(
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
                            value: placesList[index].place,
                            iconSize: 20,
                            elevation: 16,
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              color: kwhite,
                            ),
                            items: [
                              for (int index = 0;
                                  index < placesList.length;
                                  index++)
                                DropdownMenuItem<String>(
                                  value: placesList[index].place,
                                  child: Text(
                                    placesList[index].place.toString(),
                                    style:
                                        textstyle(14, FontWeight.bold, kwhite),
                                  ),
                                ),
                            ],
                            onChanged: (newValue) {
                              value.setDropDown(newValue!);
                            },
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                ),
                const SpaceWH(height: 15),
                Consumer<BookingViewModel>(
                  builder: (context, pro, child) {
                    return Container(
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
                        value: pro.isDriverRequired,
                        onChanged: (value) {
                          pro.isDriver(value!);
                          pro.getTheTotalHours(context, index);
                        },
                      ),
                    );
                  },
                ),
                const SpaceWH(height: 20),
                PickUpDateTime(index: index),
                const SpaceWH(height: 20),
                DropOffDateTime(index: index),
                const SpaceWH(height: 20),
                const SpaceWH(height: 20),
                FooterBoookingInfo(index: index),
              ],
            ),
          ),
          const SpaceWH(height: 15),
        ],
      ),
    );
  }
}
