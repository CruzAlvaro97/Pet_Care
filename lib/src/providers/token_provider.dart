import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pet_society/constants.dart';

class TokenProvider with ChangeNotifier {
  final String _baseUrl = 'gmlqcelelvidskpttktm.supabase.co';

  final Map<String, String> _headers = {
    'apiKey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
  };

  Future<String> _getJsonData(
    String endpoint,
    String correoUsuario,
    Map<String, String> body,
  ) async {
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'correo_usuario': 'eq.$correoUsuario',
      },
    );

    final response = await http.patch(url, headers: _headers, body: body);

    if (response.statusCode == 204) {
      print('Actualizacion de token con exito');
    } else {
      print('Fallo la actualizacion de token');
    }

    return response.body;
  }

  updateTokenUser(String correoUsuario, String token) async {
    final jsonData = await _getJsonData(
      'rest/v1/usuario',
      correoUsuario,
      {
        'token_id': token,
      },
    );
  }

  Future<bool> pushNotificationsSpecificDevice({
    required String token,
    required String title,
    required String body,
  }) async {
    String dataNotifications = '{ "to" : "$token",'
        ' "notification" : {'
        ' "title":"$title",'
        '"body":"$body"'
        ' }'
        ' }';

    await http.post(
      Uri.parse(Constants.BASE_URL),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=${Constants.KEY_SERVER}',
      },
      body: dataNotifications,
    );
    return true;
  }

  agruparDispostivos() async {
    await FirebaseMessaging.instance.subscribeToTopic('myTopic1');
  }
}
