import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';

ButtonStyle textButtonDecorationWidget() {
  return TextButton.styleFrom(
    surfaceTintColor: CustomColor.white2,
    disabledForegroundColor: CustomColor.white2,
    foregroundColor: CustomColor.white2,
    shadowColor: CustomColor.white2,
    backgroundColor: CustomColor.white2,
    disabledBackgroundColor: CustomColor.white2,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
