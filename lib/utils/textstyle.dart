import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_ride/utils/colors.dart';

TextStyle homeHead(size) {
  return GoogleFonts.robotoMono(
      wordSpacing: 2,
      color: grayText,
      fontWeight: FontWeight.w700,
      letterSpacing: 2,
      fontSize: size.width * 0.06,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.dotted,
      decorationThickness: 3,
      decorationColor: kBlack);
}

final headline = GoogleFonts.robotoMono(
  fontSize: 30,
  letterSpacing: 3,
  color: kBlack,
  fontWeight: FontWeight.bold,
);

final headline1 = GoogleFonts.robotoMono(
  fontSize: 24,
  color: kBlack,
  fontWeight: FontWeight.bold,
);

final headline2 = GoogleFonts.robotoMono(
  fontSize: 14,
  color: kwhite,
  fontWeight: FontWeight.w600,
);
final headline3 = GoogleFonts.robotoMono(
  fontSize: 14,
  color: grayText,
  fontWeight: FontWeight.bold,
);
final headline4 = GoogleFonts.robotoMono(
  color: grayText,
  fontWeight: FontWeight.w700,
  letterSpacing: 2,
  fontSize: 20,
);
final headline5 = GoogleFonts.robotoMono(
  color: kwhite,
  fontWeight: FontWeight.w700,
  letterSpacing: 2,
  fontSize: 20,
);

final headline6 = GoogleFonts.robotoMono(
  color: kBlack,
  fontWeight: FontWeight.w700,
  letterSpacing: 2,
  fontSize: 20,
);
final hintStyle = GoogleFonts.robotoMono(
  fontSize: 16,
  color: grayText,
  fontWeight: FontWeight.bold,
);

final titleCardName = GoogleFonts.montserrat(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

textstyle(double size, FontWeight fweight, Color clr) {
  return GoogleFonts.robotoMono(
    letterSpacing: 0.5,
    fontSize: size,
    fontWeight: fweight,
    color: clr,
  );
}
textstyles(double size, FontWeight fweight, Color clr) {
  return GoogleFonts.montserrat(
    letterSpacing: 0.5,
    fontSize: size,
    fontWeight: fweight,
    color: clr,
  );
}