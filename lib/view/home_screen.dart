import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/home/available_cars.dart';
import 'package:rent_a_ride/components/home/driver_ads.dart';
import 'package:rent_a_ride/components/home/offer_section.dart';
import 'package:rent_a_ride/components/home/user_drawer.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view_model/cars_view_model.dart';
import 'package:rent_a_ride/view_model/user_login_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = context.watch<CarsViewModel>();
    final provider = context.watch<UserLoginViewModel>();
    // provider.getUserDetails();
    // pro.getAllCars();
    return Scaffold(
      backgroundColor: kwhite,
      drawer: const Drawer(
        child: UserDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: blueButton,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: textstyle(14, FontWeight.bold, kwhite),
            ),
            Text(
              provider.userName == null
                  ? "person "
                  : provider.userName!.toUpperCase(),
              style: textstyle(21, FontWeight.bold, kwhite),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfferSection(),
            const AvailableCars(),
            const HomeDriverAds()
          ],
        ),
      ),
    );
  }
}
