import 'package:flutter/material.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "IJAS AHAMMED",
              style: headline5,
            ),
            accountEmail: const Text(
              "Ijas@gmail.com",
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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.star,
              color: hashColor,
            ),
            title: const Text("Popular Services"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: hashColor,
            ),
            title: const Text("About us"),
            onTap: () {},
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
            onTap: () async{
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.remove("isLoggedIn");
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
