import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_society/src/views/pages/index_pages.dart';

class MyRoutes {
  static const String rWELCOME = '/welcome';
  static const String rLOGIN = '/login';
  static const String rRESGISTER = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/welcome'):
        return CupertinoPageRoute(builder: (_) => const WelcomePage());

      // case ('/login'):
      //   return CupertinoPageRoute(builder: (_) => const LoginPage());

      // case ('/register'):
      //   return CupertinoPageRoute(builder: (_) => const RegisterPage());

      //
      // Agregar aquí los screens
      default:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
    }
  }
}
