import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/drawer/about_us.dart';
import 'package:rent_a_ride/components/drawer/bookings/user_bookings.dart';
import 'package:rent_a_ride/components/drawer/sevices/user_services.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/splash/splash_screen.dart';
import 'package:rent_a_ride/view_model/user_login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserLoginViewModel>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 150,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                provider.userName == null
                    ? "person 1"
                    : provider.userName!.toUpperCase(),
                style: textstyle(20, FontWeight.w600, kwhite),
              ),
              accountEmail: Text(
                provider.userEmail ?? "person@gmail.com",
                style: textstyle(15, FontWeight.w600, grayText),
              ),
              decoration: const BoxDecoration(
                gradient: specialCard2,
              ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUS(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: hashColor,
            ),
            title: const Text("Share"),
            onTap: () {
            },
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
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: kwhite,
                    title: Text(
                      "Log Out",
                      style: textstyle(14, FontWeight.bold, kBlack),
                    ),
                    content: const Text(
                        "Are you sure do you want to logout the App?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove("isLoggedIn");
                          prefs.remove("USER_NAME");
                          prefs.remove("USER_EMAIL");
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return const SplashScreen();
                            },
                          ), (route) => false);
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
