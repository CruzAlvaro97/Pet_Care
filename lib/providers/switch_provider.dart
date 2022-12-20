import 'package:flutter/material.dart';
import 'package:pet_society/src/models/pets_adoption_model.dart';
import 'package:pet_society/src/models/pets_help_model.dart';

// Gestores de estado: Provider

class CambioProviderAdopcion extends ChangeNotifier {
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
}

class CambioProviderHelp extends ChangeNotifier {
  String status = 'Perdido';
  int resultado = petsHelp.length;

  String get isCambio => status;

  filtroAyuda(String value) {
    status = value;
    notifyListeners();
  }

  totalAyuda(int value) {
    resultado = value;
    notifyListeners();
  }
}
