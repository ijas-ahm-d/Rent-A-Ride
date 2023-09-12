import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/view/splash_screen.dart';
import 'package:rent_a_ride/view_model/booking_view_model.dart';
import 'package:rent_a_ride/view_model/cars_view_model.dart';
import 'package:rent_a_ride/view_model/driver_view_model.dart';
import 'package:rent_a_ride/view_model/my_bookings_view_model.dart';
import 'package:rent_a_ride/view_model/payment_view_model.dart';
import 'package:rent_a_ride/view_model/places_view_model.dart';
import 'package:rent_a_ride/view_model/sample.dart';
import 'package:rent_a_ride/view_model/user_login_view_model.dart';
import 'package:rent_a_ride/view_model/user_signup_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Backend
  // Stripe.publishableKey =
  //     "pk_test_51Mg3gFSFAwfsuLHcJkrQ5LqsAaNZjnbuQm0nVRjnRZN0qRtWcxZY1BBH18v94drHf15G2fCbTRb6PMr0f4CXmvKE00JRka5zhs";
  // Mine
  Stripe.publishableKey =
      "pk_test_51N3uIVSEurDXAlrNIzE0G5gxEG7wWQXH3eCofs75Qcb4P6CTI8NZFFtuGN4JDon7BWA9IN9RT4lrkSlQhFlHihWw00FbLfPSnn";
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
          create: (context) => MyBookingsViewModel(),
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
        
        ChangeNotifierProvider(
          create: (context) => PaymentViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DriverViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Sample(),
        ),
      ],
      child: MaterialApp(
        title: 'Rent-My-Wheels',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}