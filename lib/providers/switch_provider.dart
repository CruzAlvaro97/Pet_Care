import 'package:flutter/material.dart';
import 'package:pet_society/src/models/pets_adoption_model.dart';

// Gestores de estado: Provider

class CambioProvider extends ChangeNotifier {
  String especie = 'Todos';
  int resultado = petsAdoption.length;

  String get isCambio => especie;

  filtroAdopcion(String value) {
    especie = value;
    notifyListeners();
  }

  totalAdopcion(int value) {
    resultado = value;
    notifyListeners();
  }

  // bttncambiar() {
  //   (dato1 == false) ? (dato1 = true) : (dato1 = false);
  //   // si el dato es falso, cambiar a true, si no, mantener en falso
  //   notifyListeners();
  // }
}
