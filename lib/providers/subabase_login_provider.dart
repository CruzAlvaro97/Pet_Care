import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pet_society/src/models/usuario_model.dart';
import 'package:pet_society/src/preferences/user_preferences.dart';

class UserProvider extends ChangeNotifier {
  List<Usuario> usuario2Datos = [];

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
      getDatauser(email!);
      print('se guardo correctamente');
    }

    notifyListeners();

    return msg;
  }

  getDatauser(String correo) async {
    final Map<String, String> _headers = {
      'apiKey':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
    };

    var url =
        'https://gmlqcelelvidskpttktm.supabase.co/rest/v1/usuario?correo_usuario=eq.$correo';

    // Almacenar un respuesta de tipo Response (del servicio)
    final response = await http.get(Uri.parse(url), headers: _headers);

    List<dynamic> listaDinamica = jsonDecode(response.body);

    usuario2Datos.clear();

    listaDinamica.forEach((element) {
      final Usuario usuario = Usuario.fromMap(element);
      usuario2Datos.add(usuario);
    });

    PreferencesUser.id = usuario2Datos[0].id;
    PreferencesUser.nombreUsuario = usuario2Datos[0].nombreUsuario!;
    PreferencesUser.apellidoUsuario = usuario2Datos[0].apellidoUsuario;
    PreferencesUser.usernameUsuario = usuario2Datos[0].usernameUsuario;
    PreferencesUser.correoUsuario = usuario2Datos[0].correoUsuario;

    return print(
        'NOMBRE => ${usuario2Datos[0].nombreUsuario} \nAPELLIDO => ${usuario2Datos[0].apellidoUsuario} \nUSERNAME => ${usuario2Datos[0].usernameUsuario}  \nCORREO => ${usuario2Datos[0].correoUsuario}');
  }
}
