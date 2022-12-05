import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_society/src/views/pages/index_pages.dart';

class MyRoutes {
  static const String rWELCOME = '/welcome';
  static const String rLOGIN = '/login';
  static const String rRESGISTER = '/register';
  static const String rONBOARDING = '/onboarding';
  static const String rHOME = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      // Register route
      case ('/onboarding'):
        return CupertinoPageRoute(builder: (_) => const OnboardingPage());
      //

      // Welcome route
      case ('/welcome'):
        return CupertinoPageRoute(builder: (_) => const WelcomePage());
      //

      // Login route
      case ('/login'):
        return CupertinoPageRoute(builder: (_) => const LoginPage());
      //

      // Register route
      case ('/register'):
        return CupertinoPageRoute(builder: (_) => const RegisterPage());
      //

      // Home route
      case ('/home'):
        return CupertinoPageRoute(builder: (_) => const HomePage());
      //

      //
      // Agregar aquí los screens
      default:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
    }
  }
}
