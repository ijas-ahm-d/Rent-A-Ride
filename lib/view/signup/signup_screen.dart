import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/model/signup/services/signup_services.dart';
import 'package:rent_a_ride/model/signup/signup_model.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/images.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/login/login_screen.dart';
import 'package:rent_a_ride/view/otp/otp_screen.dart';
// import 'package:rent_a_ride/view/otp/otp_screen.dart';
import 'package:rent_a_ride/view/widgets/textformfield.dart';
import 'package:rent_a_ride/view_model/signup/signup_provider.dart';

// final signUpvalidateKey = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
// MediaQuery
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackBG,
      body: Consumer<SignupProvider>(
        builder: (context, providerValue, child) => Form(
          key: providerValue.SignUpFormKey,
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
                    onPressed: () {
                      
                      if (providerValue.SignUpFormKey.currentState!
                          .validate()) {
                        SignUpModel signUpModel = SignUpModel(
                            email: providerValue.emailController.text,
                            fullName: providerValue.nameController.text,
                            phoneNumber:
                                providerValue.phoneNumberController.text,
                            password: providerValue.passwordController.text);

                        SignUpService().signUpApiServices(
                          signUpModel: signUpModel,
                          context: context,
                          phoneNumber: providerValue.phoneNumberController.text,
                          email: providerValue.emailController.text,
                          fullName: providerValue.nameController.text,
                          password: providerValue.passwordController.text,
                        );
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
      ),
    );
  }
}
