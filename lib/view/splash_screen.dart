import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/images.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/home_screen.dart';
import 'package:rent_a_ride/view/login_screen.dart';
import 'package:rent_a_ride/view_model/cars_view_model.dart';
import 'package:rent_a_ride/view_model/user_login_view_model.dart';
import '../utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pro =Provider.of<UserLoginViewModel>(context);
    final size = MediaQuery.of(context).size;
        return AnimatedSplashScreen(
          backgroundColor: kwhite,
          splashIconSize: double.infinity,
          duration: 3000,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("RENT-MY-WHEELS", style: headline),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Your road to easy car rentals!",
                style: GoogleFonts.robotoMono(),
              ),
              SpaceWH(
                height: size.width * 0.1,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: Image.asset(
                  Images.splashImage,
                ),
              ),
            ],
          ),
          nextScreen:pro.isLoggedIn
          ?const HomeScreen()
          :LoginScreen() ,
          splashTransition: SplashTransition.fadeTransition,
        );
      }
  }


