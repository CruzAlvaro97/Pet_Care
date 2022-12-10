import 'package:flutter/material.dart';

// Gestores de estado: Provider

class CambioProvider extends ChangeNotifier {
  bool dato = false;
  bool dato1 = false;

  bool get isCambio => dato;

  cambio(bool value) {
    dato = value;
    notifyListeners();
  }

  bttncambiar() {
    (dato1 == false) ? (dato1 = true) : (dato1 = false);
    // si el dato es falso, cambiar a true, si no, mantener en falso
    notifyListeners();
  }
}
