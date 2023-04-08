import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:rent_a_ride/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileProvider extends ChangeNotifier {
  bool isLogin = false;

  // LogOut Function
  logOutUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("isLoggedIn");
  }

  Future getValidation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    isLogin = isLoggedIn;
    log(isLoggedIn.toString());
    log("$isLogin");
  }
}
