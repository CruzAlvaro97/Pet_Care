import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';

InputDecoration formDecorationWidget({
  final String? hintText,
  final Widget? suffixIcon,
  final Widget? prefixIcon,
  final TextStyle? hintStyle,
}) {
  return InputDecoration(
    // Bordes
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: CustomColor.error),
      borderRadius: BorderRadius.circular(20),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    ),
    //
    filled: true,
    fillColor: CustomColor.formField,
    hintText: hintText,
    hintStyle: hintStyle,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    contentPadding: const EdgeInsets.all(15),
  );
}
