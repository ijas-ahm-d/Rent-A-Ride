import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:rent_a_ride/model/otp/otp_services.dart';
import 'package:rent_a_ride/utils/space.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/textstyle.dart';
// import '../home/home_screen.dart';

final controller = TextEditingController();
final focusNode = FocusNode();

class OtpScreen extends StatelessWidget {
  OtpScreen(
      {Key? key,
      required this.phoneNumber,
      required this.fullName,
      required this.email,
      required this.password})
      : super(key: key);
  final String phoneNumber;
  final String fullName;
  final String email;
  final String password;
  final otpTextEditingController = TextEditingController();
  final formkeyOtpVerification = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackBG,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formkeyOtpVerification,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.07,
                ),
                Text(
                  'Verification Code',
                  style: headline,
                ),
                const SpaceWH(
                  height: 8.0,
                ),
                Text(
                  'Please enter the verification code that we have sent to your phonenumber',
                  style: headline4,
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),

                /// pinput package we will use here
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
                      controller: otpTextEditingController,
                      focusNode: focusNode,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        textStyle:
                            GoogleFonts.poppins(fontSize: 20, color: kwhite),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(232, 235, 241, 0.37),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        textStyle: GoogleFonts.poppins(
                          fontSize: 20,
                          color: const Color.fromRGBO(70, 69, 66, 1),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.05999999865889549),
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
                        overlayColor: MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: () {
                        if (formkeyOtpVerification.currentState!.validate()) {
                          // Ineternet connection check pendinnnnnnnnnnnnnnnnnnnnnnnnnnng
                          OtpServices().otpServices(
                              fullName: fullName,
                              email: email,
                              password: password,
                              phoneNumber: phoneNumber,
                              otpCode: otpTextEditingController.text,
                              context: context);
                        }

                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return HomeScreen();
                        //     },
                        //   ),
                        // );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Verify",
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: size.width * 0.7,
                    width: size.width * 0.7,
                    child: Image.asset(
                      otpImage,
                    ),
                  ),
                ),
                SpaceWH(
                  height: size.width * 0.12,
                ),

                /// Continue Button
                // const Expanded(child: SizedBox()),

                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Resend code?',
                      style: TextStyle(color: specialGreen),
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
