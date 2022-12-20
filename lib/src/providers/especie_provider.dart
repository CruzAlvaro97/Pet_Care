import 'package:pet_society/src/models/especie_model.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class EspecieProvider with ChangeNotifier {
  final String _baseUrl = 'gmlqcelelvidskpttktm.supabase.co';
  final Map<String, String> _headers = {
    'apiKey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
  };

  String _especieSelected = '--';

  String get especieSelected => _especieSelected;

  set cambiarSeleccion(String value) {
    _especieSelected = value;
    notifyListeners();
  }

//NOMBRE FORMULARIO
  String _Nombre = '--';

  String get Nombre => _Nombre;

  set cambiarNombre(String value) {
    _Nombre = value;
    notifyListeners();
  }

// EDAD FORMULARIO
  int _edad = 0;

  int get edad => _edad;

  set cambiarEdad(int value) {
    _edad = value;
    notifyListeners();
  }

  //DESCRIPCION FORMULARIO
  String _descripcion = '--';

  String get descripcion => _descripcion;

  set cambiarDescripcion(String value) {
    _descripcion = value;
    notifyListeners();
  }

  //Inicializar
  List<Especie> _listaEspecies = [];

  //Obtener
  List<Especie> get listaEspecies => _listaEspecies;

  EspecieProvider() {
    print('Provider EspecieService inicializado');
    getAllEspecies();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'select': '*',
      },
    );

    final response = await http.get(url, headers: _headers);

    return response.body;
  }

  getAllEspecies() async {
    final jsonData = await _getJsonData('rest/v1/especie');

    List<dynamic> listaDinamica = jsonDecode(jsonData);

    listaDinamica.forEach((element) {
      final Especie especie = Especie.fromMap(element);
      _listaEspecies.add(especie);
    });

    print('PeticiÃ³n HTTP Especies');
    notifyListeners();
  }
}
