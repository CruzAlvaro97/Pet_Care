import 'package:flutter/material.dart';

class CustomButtonAuthWidget extends StatelessWidget {
  final Color? colorButton;
  final Function? onPressed;
  final double? elevation;
  final Widget? child;

  const CustomButtonAuthWidget({
    super.key,
    this.onPressed,
    this.colorButton,
    this.elevation = 0.5,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      minWidth: double.infinity,
      elevation: elevation,
      color: colorButton!,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: child!,
      onPressed: () => onPressed!(),
    );
  }
}
