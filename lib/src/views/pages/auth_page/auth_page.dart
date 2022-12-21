import 'package:flutter/material.dart';
import 'package:pet_society/services/auth_service.dart';
import 'package:pet_society/src/views/pages/index_pages.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.leerToken(),
          builder: (
            BuildContext context,
            AsyncSnapshot<String> snapshot,
          ) {
            if (!snapshot.hasData) {
              // puede cambiarse
              return const Text(
                'Cargando...',
                style: TextStyle(fontSize: 30),
              );
            }

            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const WelcomePage(),
                      transitionDuration: const Duration(seconds: 0),
                    ));
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const HomePage(),
                      transitionDuration: const Duration(seconds: 0),
                    ));
              });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
