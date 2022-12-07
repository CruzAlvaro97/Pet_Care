import 'package:flutter/material.dart';

BoxDecoration containerDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.04),
        offset: const Offset(0.0, 4.0),
        blurRadius: 20.0,
      ),
    ],
  );
}
