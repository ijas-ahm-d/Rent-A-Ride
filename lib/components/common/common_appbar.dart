import 'package:flutter/material.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/utils/textstyle.dart';

class CommonAppbar extends StatelessWidget {
  final String title;
  final Widget widget;
  const CommonAppbar({
    super.key,
    required this.title,
    this.widget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: kBlack,
      ),
      // leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(Icons.arrow_back),),
      iconTheme: const IconThemeData(color: kBlack),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: textstyle(17, FontWeight.bold, kBlack),
      ),
      actions: [
        widget,
        const SpaceWH(
          width: 10,
        )
      ],
    );
  }
}
