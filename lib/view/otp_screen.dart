import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/view_model/user_signup_view_model.dart';
import '../utils/colors.dart';
import '../utils/images.dart';
import '../utils/textstyle.dart';

FocusNode focusNode = FocusNode();

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final providerValue = context.watch<UserSignupViewModel>();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: providerValue.isOtpLoading
              ? Center(
                  child: Lottie.asset(
                    "assets/lottie/splashCar.json",
                  ),
                )
              : Form(
                  key: providerValue.otpFormKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      Text(
                        'VERIFICATION CODE',
                        style: headline4,
                      ),
                      const SpaceWH(
                        height: 8.0,
                      ),
                      Text(
                        'Please enter the verification code that we have sent to your phonenumber',
                        style: textstyle(15, FontWeight.w500, kBlack),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Center(
                        child: SizedBox(
                          height: size.width * 0.7,
                          width: size.width * 0.7,
                          child: Image.asset(
                          Images.  otpImage,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: size.width,
                          child: Pinput(
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsRetrieverApi,
                            listenForMultipleSmsOnAndroid: true,
                            showCursor: true,
                            cursor: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 21,
                                height: 1,
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(137, 146, 160, 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            length: 6,
                            controller: providerValue.otpController1,
                            focusNode: focusNode,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            defaultPinTheme: PinTheme(
                              width: 60,
                              height: 60,
                              textStyle: GoogleFonts.poppins(
                                  fontSize: 20, color: kBlack),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(232, 232, 235, 241),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            focusedPinTheme: PinTheme(
                              width: 60,
                              height: 60,
                              textStyle: GoogleFonts.poppins(
                                  fontSize: 20, color: kBlack),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.05999999865889549),
                                    offset: Offset(0, 3),
                                    blurRadius: 16,
                                  ),
                                ],
                              ),
                            ),
                            validator: (value) {
                              if (value!.length < 6) {
                                return "Enter 6 digit OTP";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.05,
                        ),
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll(blueButton),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.green),
                            ),
                            onPressed: () async {
                              if (providerValue.otpFormKey.currentState!
                                  .validate()) {
                                await context
                                    .read<UserSignupViewModel>()
                                    .otpButton(context);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Verify",
                                style: textstyle(
                                  15,
                                  FontWeight.bold,
                                  kwhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SpaceWH(
                        height: size.width * 0.12,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Resend code?',
                            style: textstyle(
                              15,
                              FontWeight.w500,
                              specialGreen,
                            ),
                          ),
                        ),
                      ),
                      SpaceWH(
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
