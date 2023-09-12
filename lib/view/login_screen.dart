import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/common/textformfield.dart';
import 'package:rent_a_ride/utils/images.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/home_screen.dart';
import 'package:rent_a_ride/view/signup_screen.dart';
import 'package:rent_a_ride/view_model/user_login_view_model.dart';
import '../utils/colors.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
// Media Query
    final size = MediaQuery.of(context).size;
    final providervalue = context.watch<UserLoginViewModel>();
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: providervalue.isLoading
            ? Center(
                child: Lottie.asset(
                  "assets/lottie/splashCar.json",
                ),
              )
            : Form(
                key: _formkey,
                child: GestureDetector(
                  onTap: () {
                    FocusScopeNode curentFocus = FocusScope.of(context);
                    if (!curentFocus.hasPrimaryFocus) {
                      curentFocus.unfocus();
                    }
                  },
                  child: ListView(
                    children: [
                      SpaceWH(
                        height: size.width * 0.1,
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.06,
                            top: size.width * 0.06,
                            right: size.width * 0.06),
                        child: Text(
                          "Welcome back!",
                          style: headline4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.06, right: size.width * 0.06),
                        child: Text(
                          "Glad to see you, Again!",
                          style: headline1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SpaceWH(
                        height: size.width * 0.2,
                      ),

                      Column(
                        children: [
                          //*****------------Email ----------------*****//

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.06,
                                vertical: size.width * 0.03),
                            child: TextFormWidget(
                                prefixIcon: const Icon(Icons.person),
                                isEmail: true,
                                controller: providervalue.emailController,
                                hintText: "Email",
                                keyType: TextInputType.emailAddress,
                                size: size),
                          ),
                          SpaceWH(
                            height: size.width * 0.02,
                          ),

                          //*****------------PASSWORD ----------------*****//

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.06,
                                vertical: size.width * 0.03),
                            child: TextFormWidget(
                                prefixIcon: const Icon(Icons.key),
                                isObs: true,
                                isPassword: true,
                                controller: providervalue.passwordController,
                                hintText: "Password",
                                keyType: TextInputType.text,
                                size: size),
                          ),
                          //*****------------ FORGET PASSWORD ----------------*****//
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("forget your password?", style: headline3),
                              const SpaceWH(
                                width: 25,
                              )
                            ],
                          )
                        ],
                      ),

                      //*****------------ Log IN ----------------*****//

                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.1,
                            vertical: size.width * 0.07),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(blueButton),
                            overlayColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              await context
                                  .read<UserLoginViewModel>()
                                  .getLoginStatus(context);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Login",
                              style: GoogleFonts.robotoMono(),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Guest",
                            style: GoogleFonts.robotoMono(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: kBlack,
                            ),
                          ),
                        ),
                      ),
                      SpaceWH(
                        height: size.width * 0.05,
                      ),
                      SizedBox(
                        height: size.width * 0.5,
                        width: size.width * 0.5,
                        child: Image.asset(
                         Images. loginImage,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account?",
                            style: GoogleFonts.robotoMono(color: kBlack),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SignUpScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Register Now",
                              style: GoogleFonts.robotoMono(
                                color: specialGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
