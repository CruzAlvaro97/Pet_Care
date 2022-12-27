import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:http/http.dart' as http;

class DetalleAdopcionProvider with ChangeNotifier {
  bool _isVisible = false;
  String _message = 'Pendiente de aprobación';

  bool get isVisible => _isVisible;
  String get message => _message;

  final String _baseUrl = 'gmlqcelelvidskpttktm.supabase.co';
  final Map<String, String> _headers = {
    'apiKey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',

    ///'Content-Type': 'application/json',
    //'Prefer': 'return=minimal',
  };

  set isVisible(bool value) {
    _isVisible = value;
  }

  isVisibleSwitch() {
    _isVisible = !_isVisible;
    if (_isVisible == true) {
      _message = 'Publicación aprobada';
    } else {
      _message = 'Pendiente de aprobación';
    }
    notifyListeners();
  }

  Future<String> _getJsonData(
    String endpoint,
    int idPost,
    Map<String, String> body,
  ) async {
    ///===
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'id': 'eq.$idPost',
      },
    );

    final response = await http.patch(url, headers: _headers, body: body);

    return response.body;

    ///===
  }

  updateStatusPublication(
    int idPost,
    String statusPost,
  ) async {
    final jsonData = await _getJsonData(
      'rest/v1/publicacion',
      idPost,
      {
        'status_pub': statusPost,
      },
    );

    notifyListeners();
  }
}
