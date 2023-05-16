import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view/driver/driver_signup.dart';
import 'package:rent_a_ride/view_model/payment_view_model.dart';

class HomeDriverAds extends StatelessWidget {
  const HomeDriverAds({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final payment = context.watch<PaymentViewModel>();

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 0, 10),
      height: size.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hot Offer",
            style: titleCardName,
          ),
          const SpaceWH(height: 15),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: size.height * 0.37,
                height: size.height * 0.27,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kwhite,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black38,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/road.png",
                            ),
                            fit: BoxFit.cover),
                      ),
                      height: 150,
                    )
                  ],
                ),
              ),
              Positioned(
                left: 75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SpaceWH(height: 10),
                    Text(
                      "Do you want to earn with us?",
                      style: textstyle(
                        17,
                        FontWeight.w600,
                        kBlack,
                      ),
                    ),
                    const SpaceWH(height: 5),
                    Text(
                      "so don't be late!",
                      style: textstyle(
                        15,
                        FontWeight.w500,
                        hashColor,
                      ),
                    ),
                    const SpaceWH(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DriverSignup(),
                          ),
                        );
                      },
                      child: Container(
                        height: 45,
                        width: size.width * 0.5,
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 14),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 7,
                                spreadRadius: 0.5,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: blueButton),
                        child: Center(
                          child: Text(
                            " BECOME A DRIVER ",
                            style: textstyle(
                              15,
                              FontWeight.w700,
                              kwhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 180,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/carOtp.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
