import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/common/common_snackbar.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view_model/booking_view_model.dart';

class FooterBoookingInfo extends StatelessWidget {
  const FooterBoookingInfo({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingViewModel>();
    return Consumer<BookingViewModel>(
      builder: (context, value, child) {
        return Column(
          children: [
            const SpaceWH(height: 10),
            Text(
              provider.totalHors == 0
                  ? "Total Hours : 0"
                  : "Total Hours : ${provider.totalHors}",
              style: textstyle(17, FontWeight.w500, kBlack),
            ),
            GestureDetector(
              onTap: () {
                if (provider.totalamount != 0 && provider.totalHors != 0) {
                  Provider.of<BookingViewModel>(context, listen: false)
                      .bookCar(context: context, index: index);
                } else {
                  CommonSnackBAr.snackBar(
                    context: context,
                    data: "complete the form",
                    color: snackbarwarn,
                  );
                }
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 12, 10, 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                decoration: BoxDecoration(
                  // gradient: specialCard2,
                  color: blueButton,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 7,
                      spreadRadius: 0.5,
                    )
                  ],
                ),
                child: Text(
                  provider.totalamount == 0
                      ? "Total Amount : 0"
                      : "Total Amount : ${provider.totalamount}",
                  style: textstyle(17, FontWeight.w500, kwhite),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
