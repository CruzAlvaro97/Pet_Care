import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? text;
  final Color? colorButton;
  final TextStyle? textStyle;
  final Function? onPressed;

  const CustomButtonWidget(
      {super.key,
      this.text = '',
      this.onPressed,
      this.colorButton,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      elevation: 5,
      color: colorButton!,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        text!,
        style: textStyle!,
      ),
      onPressed: () => onPressed!(),
    );
  }
}
