import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/view/splash/splash_screen.dart';
import 'package:rent_a_ride/view_model/booking/booking_view_model.dart';
import 'package:rent_a_ride/view_model/cars/cars_view_model.dart';
import 'package:rent_a_ride/view_model/places/places_view_model.dart';
import 'package:rent_a_ride/view_model/user_login_view_model.dart';
import 'package:rent_a_ride/view_model/user_profile/user_profile_provider.dart';
import 'package:rent_a_ride/view_model/user_signup_view_model.dart';

const saveKeyName = "IsLoggedIn";
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CarsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlacesViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserLoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserSignupViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingViewModel(),
        ),
        // user profile provider
        ChangeNotifierProvider(
          create: (context) {
            return UserProfileProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Rent-A-Ride',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
