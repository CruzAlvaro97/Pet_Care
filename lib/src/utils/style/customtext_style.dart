import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/utils/index_utils.dart';

class CustomTextStyle {
  static TextStyle headerStyle = GoogleFonts.poppins(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static TextStyle paragraphStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static TextStyle buttonStyleWhite = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: CustomColor.white,
  );

  static TextStyle buttonStylePurple = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: CustomColor.primary,
  );
  // Aquí se definirán los estilos de fuente
}
