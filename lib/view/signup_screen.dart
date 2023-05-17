import 'package:flutter/material.dart';
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
      backgroundColor: blackBG,
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
                        "Welcome to RENT-A-RIDE",
                        style: headline,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Text(
                      "sign up this page for accessing cars",
                      style: headline4,
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
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Sign up",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: size.width * 0.5,
                        height: size.width * 0.45,
                        child: Image.asset(
                          signupImage,
                          color: kwhite,
                        )),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "already have an account?",
                          style: TextStyle(color: kwhite),
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
                          child: const Text(
                            "Login Now",
                            style: TextStyle(
                              color: Color.fromARGB(255, 53, 194, 193),
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
