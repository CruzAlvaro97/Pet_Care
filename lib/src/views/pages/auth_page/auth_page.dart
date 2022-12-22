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
              return SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.asset(
                  'assets/images/picture-loading2.gif',
                  fit: BoxFit.fitHeight,
                ),
              );
            }

            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const OnboardingPage(),
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
