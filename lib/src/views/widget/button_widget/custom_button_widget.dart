import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? text;
  final Color? colorButton;
  final TextStyle? textStyle;
  final Function? onPressed;
  final double? elevation;

  const CustomButtonWidget({
    super.key,
    this.text = '',
    this.onPressed,
    this.colorButton,
    this.textStyle,
    this.elevation = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      minWidth: double.infinity,
      elevation: elevation,
      color: colorButton!,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        text!,
        style: textStyle!,
      ),
      onPressed: () => onPressed!(),
    );
  }
}
