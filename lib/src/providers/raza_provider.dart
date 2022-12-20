import 'dart:convert';

import 'package:pet_society/src/models/raza_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class RazaProvider with ChangeNotifier {
  final String _baseUrl = 'gmlqcelelvidskpttktm.supabase.co';
  final Map<String, String> _headers = {
    'apiKey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
  };

  List<Raza> _listaRazas = [];
  List<Raza> _listaRazasFiltradas = [];

  String _razaSelected = '--';

  String get razaSelected => _razaSelected;

  set cambiarSeleccion(String value) {
    _razaSelected = value;
    notifyListeners();
  }

  List<Raza> get listaRazas => _listaRazas;
  List<Raza> get listaRazasFiltradas => _listaRazasFiltradas;

  set cambiarListaRazas(List<Raza> listaFiltrada) {
    _listaRazasFiltradas = listaFiltrada;
    notifyListeners();
  }

  RazaProvider() {
    print('Provider RazaServiceInicializado');

    getAllRazas();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'select': '*',
    });

    final response = await http.get(url, headers: _headers);

    return response.body;
  }

  getAllRazas() async {
    final jsonData = await _getJsonData('rest/v1/raza');

    List<dynamic> listaDinamica = jsonDecode(jsonData);

    listaDinamica.forEach((element) {
      final Raza raza = Raza.fromMap(element);
      _listaRazas.add(raza);
    });

    print('PeticiÃ³n HTTP Razas');
    notifyListeners();
  }
}
