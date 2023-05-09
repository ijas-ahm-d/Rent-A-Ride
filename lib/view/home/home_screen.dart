import 'package:flutter/material.dart';
import 'package:rent_a_ride/components/home/driver_ads.dart';
import 'package:rent_a_ride/components/home/user_drawer.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/car_list/car_list.dart';
import 'package:rent_a_ride/view/home/widgets/home_available_cars.dart';
import 'package:rent_a_ride/view/home/widgets/home_best_offers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      drawer: const Drawer(
        child: UserDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: bodyColor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Hello"),
            Text("Ijas Ahammed"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///OFFERS SECTION
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("BEST OFFERS", style: titleCardName),
            ),
            HomeBestOffers(size: size),

            ///AVAILABLE CARS
            ///contains few car list like a card
            ///see more button tho see complete list of available cars
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("AVAILABLE CARS", style: titleCardName),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CarList(),
                      ),
                    );
                  },
                  child: const Text(
                    "See more.",
                    style: TextStyle(color: blueButton),
                  ),
                ),
              ],
            ),
            HomeAvailbleCars(size: size),
            HomeDriverAds(size: size)
          ],
        ),
      ),
    );
  }
}
