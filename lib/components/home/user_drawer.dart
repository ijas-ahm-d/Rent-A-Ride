import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/drawer/about_us.dart';
import 'package:rent_a_ride/components/drawer/bookings/user_bookings.dart';
import 'package:rent_a_ride/components/drawer/sevices/user_services.dart';
import 'package:rent_a_ride/components/drawer/share_app.dart';
import 'package:rent_a_ride/components/drawer/terms_and_conditon.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/splash_screen.dart';
import 'package:rent_a_ride/view_model/user_login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserLoginViewModel>();
    final navigator = Navigator.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 150,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                provider.userName == null
                    ? "person"
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
              navigator.push(
                PageTransition(
                  type: PageTransitionType.leftToRight,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  child: const UserBookings(),
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
              navigator.push(
                PageTransition(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  type: PageTransitionType.leftToRight,
                  child: const UserServices(),
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
              navigator.push(
                PageTransition(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  type: PageTransitionType.leftToRight,
                  child: const AboutUS(),
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
              shareAppFile(context);
            },
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.policy,
          //     color: hashColor,
          //   ),
          //   title: const Text("Privacy policy"),
          //   onTap: () {},
          // ),
          ListTile(
            leading: const Icon(
              Icons.my_library_books,
              color: hashColor,
            ),
            title: const Text("Terms and Conditions"),
            onTap: () {
              navigator.push(
                PageTransition(
                  type: PageTransitionType.leftToRight,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  child: const TermsAndCondition(),
                ),
              );
            },
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
                          navigator.pushAndRemoveUntil(
                              PageTransition(
                                type: PageTransitionType.topToBottom,
                                child: const SplashScreen(),
                              ),
                              (route) => false);
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
