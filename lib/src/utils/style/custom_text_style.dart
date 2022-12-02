import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/utils/index_utils.dart';

class CustomTextStyle {
  static TextStyle welcome = GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: CustomColor.primary,
  );

  static TextStyle headline = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    // color: CustomColor.white,
  );

  static TextStyle headline2 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    // color: CustomColor.white,
  );

  static TextStyle titleSlider = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    // color: CustomColor.white,
  );

  static TextStyle seeMoreText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    // color: CustomColor.white,
  );

  static TextStyle title = GoogleFonts.poppins(
    fontSize: 16,
    // fontWeight: FontWeight.w,
  );

  static TextStyle text = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    // color: CustomColor.white,
  );

  static TextStyle textPrimary = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: CustomColor.primary,
  );

  static TextStyle textGrey = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: CustomColor.grey,
  );

  static TextStyle text2 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    // color: CustomColor.white,
  );

  static TextStyle text2White = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: CustomColor.white,
  );

  static TextStyle text2Primary = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: CustomColor.primary,
  );

  static TextStyle text2Grey = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: CustomColor.grey,
  );

  static TextStyle paragraph = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    // color: CustomColor.white,
  );

  static TextStyle helperText = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: CustomColor.grey,
  );

  static TextStyle helperText2 = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: CustomColor.grey,
  );

  // Aquí se definirán los estilos de fuente
}

// class CustomText extends StatelessWidget {
//   final Color? color;
//   final String? text;
//   static Widget headline = Text('');

//   const CustomText({super.key, this.color, this.text = ''});

//   @override
//   Widget build(BuildContext context) {
//     return headline = Text(text!,
//         style: GoogleFonts.poppins(
//           fontSize: 14,
//           fontWeight: FontWeight.w700,
//           color: color!,
//         ));
//   }
// }
