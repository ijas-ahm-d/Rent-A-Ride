import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/images.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/signup/signup_screen.dart';
import 'package:rent_a_ride/view_model/user_login_view_model.dart';
import '../../utils/colors.dart';
import '../widgets/textformfield.dart';

/// This screen is for user login
/// If the user have already an account
/// on our application then user can Log in
/// and if the user has no account then
/// user can create a new account using the
/// Register now link;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
// Media Query
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackBG,
      body: SafeArea(
        child: Consumer<UserLoginViewModel>(
          builder: (context, providervalue, child) {
            return Form(
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
                    // Greating text
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Text(
                        "Welcome back! \nGlad to see you, Again!",
                        style: headline,
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
                          children: const [
                            Text("forget your password?", style: headline3),
                            SpaceWH(
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
                          vertical: size.width * 0.09),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(blueButton),
                          overlayColor: MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            await context
                                .read<UserLoginViewModel>()
                                .getLoginStatus(context);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Login",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.5,
                      width: size.width * 0.5,
                      child: Image.asset(
                        loginImage,
                      ),
                    ),
                    SpaceWH(
                      height: size.width * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account?",
                          style: TextStyle(color: kwhite),
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
                          child: const Text(
                            "Register Now",
                            style: TextStyle(
                              color: specialGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
