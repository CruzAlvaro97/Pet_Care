import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_society/src/models/usuario_model.dart';
import 'package:pet_society/src/preferences/formadoptation_preferences.dart';
import 'package:pet_society/src/preferences/user_preferences.dart';
import 'package:pet_society/src/providers/token_provider.dart';
import 'package:provider/provider.dart';

class UsuarioProvider with ChangeNotifier {
  final Map<String, String> _headers = {
    'apiKey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
  };

  List<Usuario> usuarioDatos = [];

  bool isLoading = true;

  UsuarioProvider() {
    print('Inicializacion UsuarioProvider');
  }

  getDatauser(String correo) async {
    isLoading = true;
    notifyListeners();

    var url =
        'https://gmlqcelelvidskpttktm.supabase.co/rest/v1/usuario?correo_usuario=eq.$correo';

    // Almacenar un respuesta de tipo Response (del servicio)
    final response = await http.get(Uri.parse(url), headers: _headers);

    List<dynamic> listaDinamica = jsonDecode(response.body);

    usuarioDatos.clear();

    listaDinamica.forEach((element) {
      final Usuario usuario = Usuario.fromMap(element);
      usuarioDatos.add(usuario);
    });

    PreferencesUser.id = usuarioDatos[0].id;
    PreferencesUser.nombreUsuario = usuarioDatos[0].nombreUsuario!;
    PreferencesUser.apellidoUsuario = usuarioDatos[0].apellidoUsuario;
    PreferencesUser.usernameUsuario = usuarioDatos[0].usernameUsuario;
    PreferencesUser.correoUsuario = usuarioDatos[0].correoUsuario;
    PreferencesUser.fotoUsuario = usuarioDatos[0].fotoUsuario;
    PreferencesUser.token = usuarioDatos[0].token;

    isLoading = false;
    notifyListeners();

    return print(
      'NOMBRE => ${usuarioDatos[0].nombreUsuario} \nAPELLIDO => ${usuarioDatos[0].apellidoUsuario} \nUSERNAME => ${usuarioDatos[0].usernameUsuario}  \nCORREO => ${usuarioDatos[0].correoUsuario} \nFOTO => ${usuarioDatos[0].fotoUsuario} \nTOKEN => ${usuarioDatos[0].token}',
    );
  }
}
