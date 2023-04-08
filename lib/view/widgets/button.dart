import 'package:flutter/material.dart';
import 'package:rent_a_ride/utils/colors.dart';
class SpecialButton extends StatelessWidget {
  const SpecialButton({super.key, required this.childIcon, this.border});

  final dynamic childIcon;
  final dynamic border;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          
          border: border,
          boxShadow: [
          const  BoxShadow(
              color: kBlack,
              offset:  Offset(3, 3),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
                color: Colors.grey.shade800,
                offset:const  Offset(-4, -4),
                blurRadius: 7,
                spreadRadius: 1)
          ],
        ),
        child: Center(
          child: childIcon,
        ),
      ),
    );
  }
}