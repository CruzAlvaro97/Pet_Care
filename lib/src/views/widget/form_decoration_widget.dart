import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';

InputDecoration FormDecorationWidget({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: CustomColor.primary),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: CustomColor.primary),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: CustomColor.error),
      borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: CustomColor.primary),
      borderRadius: BorderRadius.circular(15),
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    prefixIconColor: CustomColor.primary,
    contentPadding: const EdgeInsets.all(15),
  );
}
