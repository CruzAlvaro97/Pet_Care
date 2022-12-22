import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_society/src/models/publication3_model.dart';

class PublicacionProvider with ChangeNotifier {
  final String _baseUrl = 'gmlqcelelvidskpttktm.supabase.co';
  final Map<String, String> _headers = {
    'apiKey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
  };

  List<Publication3> listaPublicacion3 = [];

  bool isLoading = true;

  PublicacionProvider() {
    print('Inicialización PublicacionProvider');

    getAllPublications();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'select': '*,usuario(*)',
      },
    );

    final response = await http.get(url, headers: _headers);

    return response.body;
  }

  getAllPublications() async {
    isLoading = true;
    notifyListeners();

    final jsonData = await _getJsonData('rest/v1/publicacion');

    List<dynamic> listaDinamica = jsonDecode(jsonData);

    listaDinamica.forEach((element) {
      Publication3 publicacion = Publication3.fromMap(element);
      listaPublicacion3.add(publicacion);
    });

    print(listaPublicacion3);

    print('Petición HTTP Publicaciones');
    isLoading = false;

    notifyListeners();
  }

  Future<void> refreshList() async {
    // isLoading = true;
    // notifyListeners();

    final jsonData = await _getJsonData('rest/v1/publicacion');

    List<dynamic> listaDinamica = jsonDecode(jsonData);

    listaPublicacion3.clear();

    listaDinamica.forEach((element) {
      Publication3 publicacion = Publication3.fromMap(element);
      listaPublicacion3.add(publicacion);
    });

    print(listaPublicacion3);

    print('Petición HTTP Publicaciones');
    //isLoading = false;

    notifyListeners();
  }
}
