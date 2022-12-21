import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  String? nombre;
  String? apellidos;
  String? usuario;
  String? email;
  String urlbase = 'https://gmlqcelelvidskpttktm.supabase.co/rest/v1/usuario';
  String keydb =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk';
  String auth =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk';

  // API
  Future<String> guardarDB() async {
    final url = Uri.parse(urlbase);
    final String msg;

    Map<String, String> header = {
      'apikey': keydb,
      'Authorization': auth,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final body = jsonEncode({
      "nombre_usuario": "$nombre",
      "apellido_usuario": "$apellidos",
      "username_usuario": "$usuario",
      "correo_usuario": "$email"
    });

    final response = await http.post(url, body: body, headers: header);
    notifyListeners();

    if (response.statusCode != 201) {
      msg = 'no se guardo correctamente';
      print('no se guardo correctamente');
    } else {
      msg = 'se guardo correctamente';
      print('se guardo correctamente');
    }
    notifyListeners();

    return msg;
  }
}
