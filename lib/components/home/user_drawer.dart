import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/drawer/bookings/user_bookings.dart';
import 'package:rent_a_ride/components/drawer/sevices/user_services.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/splash/splash_screen.dart';
import 'package:rent_a_ride/view_model/my_bookings_view_model.dart';
import 'package:rent_a_ride/view_model/user_login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final p = context.watch<MyBookingsViewModel>();

    final provider = context.watch<UserLoginViewModel>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              provider.userName ?? "person 1",
              style: headline5,
            ),
            accountEmail: Text(
              provider.userEmail ?? "person@gmail.com",
              style: headline3,
            ),
            decoration: BoxDecoration(
              color: bodyColor,
              image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/carLogo.png",
                  ),
                  fit: BoxFit.contain),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.bookmarks,
              color: hashColor,
            ),
            title: const Text("My Bookings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const UserBookings();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.star,
              color: hashColor,
            ),
            title: const Text("Popular Services"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const UserServices();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: hashColor,
            ),
            title: const Text("About us"),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return  Helo();
              //   },
              // ));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: hashColor,
            ),
            title: const Text("Share"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.policy,
              color: hashColor,
            ),
            title: const Text("Privacy policy"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.my_library_books,
              color: hashColor,
            ),
            title: const Text("Terms and Conditions"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.power_settings_new_sharp,
              color: hashColor,
            ),
            title: const Text("Log Out"),
            onTap: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.remove("isLoggedIn");
              prefs.remove("USER_NAME");
              prefs.remove("USER_EMAIL");
              // ignore: use_build_context_synchronously
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return const SplashScreen();
                },
              ), (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

// //GET THE user name
// Future<String?> getUserName() async {
//   final prefs = await SharedPreferences.getInstance();
//   final userName = prefs.getString("USER_NAME");
//   return userName;
// }
// //GET THE user Email
// Future<String?> getUserEmail() async {
//   final prefs = await SharedPreferences.getInstance();
//   final userEmail = prefs.getString("USER_EMAIL");
//   return userEmail;
// }
