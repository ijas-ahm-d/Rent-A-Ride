import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/common/textformfield.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/images.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/login_screen.dart';
import 'package:rent_a_ride/view_model/user_signup_view_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
// MediaQuery
    final size = MediaQuery.of(context).size;
    final providerValue = context.watch<UserSignupViewModel>();
    return Scaffold(
      backgroundColor: kwhite,
      body: providerValue.isLoading
          ? Center(
              child: Lottie.asset(
                "assets/lottie/splashCar.json",
              ),
            )
          : Form(
              key: providerValue.signUpFormKey,
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode curentFocus = FocusScope.of(context);
                  if (!curentFocus.hasPrimaryFocus) {
                    curentFocus.unfocus();
                  }
                },
                child: ListView(
                  children: [
                    //*****------------HEADING ----------------*****//
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.06,
                          top: size.width * 0.06,
                          right: size.width * 0.06),
                      child: Text(
                        "WELCOME TO ",
                        style: headline4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.06, right: size.width * 0.06),
                      child: Text(
                        "RENT-MY-WHEELS",
                        style: headline,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "sign up this page for accessing cars.",
                      style: GoogleFonts.robotoMono(),
                      textAlign: TextAlign.center,
                    ),

                    SpaceWH(
                      height: size.width * 0.1,
                    ),
                    //*****------------USER NAME ----------------*****//
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.width * 0.03),
                      child: TextFormWidget(
                        prefixIcon: const Icon(Icons.person),
                        size: size,
                        hintText: "Username",
                        controller: providerValue.nameController,
                        keyType: TextInputType.text,
                        isUser: true,
                      ),
                    ),
                    //*****------------Email ----------------*****//

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.width * 0.03),
                      child: TextFormWidget(
                        prefixIcon: const Icon(Icons.email),
                        size: size,
                        hintText: "Email",
                        controller: providerValue.emailController,
                        keyType: TextInputType.emailAddress,
                        isEmail: true,
                      ),
                    ),
                    //*****------------PHONENUMBER ----------------*****//

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.width * 0.03),
                      child: TextFormWidget(
                        prefixIcon: const Icon(Icons.phone),
                        size: size,
                        hintText: "Phonenumber",
                        controller: providerValue.phoneNumberController,
                        keyType: TextInputType.phone,
                        isPhone: true,
                      ),
                    ),
                    //*****------------PASSWORD----------------*****//

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.width * 0.03),
                      child: TextFormWidget(
                        prefixIcon: const Icon(Icons.key),
                        size: size,
                        hintText: "Password",
                        controller: providerValue.passwordController,
                        keyType: TextInputType.text,
                        isPassword: true,
                        isObs: true,
                      ),
                    ),
                    //*****------------ sign up ----------------*****//
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.2,
                        top: size.width * 0.035,
                        right: size.width * 0.2,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(blueButton),
                          overlayColor: MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () async {
                          if (providerValue.signUpFormKey.currentState!
                              .validate()) {
                            await context
                                .read<UserSignupViewModel>()
                                .getSignUpStatus(context);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.robotoMono(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      height: size.width * 0.45,
                      child: Image.asset(
                      Images.  signupImage,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "already have an account?",
                          style: GoogleFonts.robotoMono(color: kBlack),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Login Now",
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
    );
  }
}
