import 'package:flutter/material.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/car_list/car_list.dart';
import 'package:rent_a_ride/view/home/widgets/home_available_cars.dart';
import 'package:rent_a_ride/view/home/widgets/driver_ads.dart';
import 'package:rent_a_ride/view/home/widgets/home_best_offers.dart';
import 'package:rent_a_ride/view/home/widgets/user_drawer.dart';
import 'package:rent_a_ride/view/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: bodyColor,
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
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.remove("isLoggedIn");
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return const SplashScreen();
                },
              ), (route) => false);
              // CommonSnackBAr().snackBar(
              //     context: context, data: " Log Out", color: specialGreen);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///HEADER SECTION
              ///Contains the offers which gives to the user
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("BEST OFFERS", style: homeHead(size)),
              ),
              HomeBestOffers(size: size),

              ///AVAILABLE CARS
              ///contains few car list like a card
              ///see more button tho see complete list of available cars
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("AVAILABLE CARS", style: homeHead(size)),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarList(),
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

              ///DRIVERS FORM
              ///user can join us a driver in our team
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("HOT OFFER", style: homeHead(size)),
              ),
              HomeDriverAds(size: size)
            ],
          ),
        ),
      ),
    );
  }
}
