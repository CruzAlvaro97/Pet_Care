import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                // Login Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Iniciar Sesión',
                      style: CustomTextStyle.headerStyle,
                    ),
                  ],
                ),
                //

                const SizedBox(height: 10),

                // Login Description
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Ingresa tus credenciales para \nacceder a tu cuenta.",
                      style: CustomTextStyle.paragraphStyle,
                    ),
                  ],
                ),
                //

                const SizedBox(height: 40),

                // Email header form
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Email",
                      style: CustomTextStyle.paragraphStyle,
                    ),
                  ],
                ),
                //

                const SizedBox(height: 5),

                // Login email form
                //

                const SizedBox(height: 20),

                // Password header form
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Constraseña",
                      style: CustomTextStyle.paragraphStyle,
                    ),
                  ],
                ),
                //

                const SizedBox(height: 5),

                // Login password form
                //

                const SizedBox(height: 10),

                // Forgot password?
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "¿Olvidaste tu constraseña?",
                      style: CustomTextStyle.paragraphStyle,
                    ),
                  ],
                ),
                //

                const SizedBox(height: 30),

                // Login Button
                CustomButtonWidget(
                  text: 'Iniciar Sesión',
                  textStyle: CustomTextStyle.buttonStyleWhite,
                  colorButton: CustomColor.primary,
                  onPressed: () {},
                ),
                //

                const SizedBox(height: 40),

                // Register Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "¿No tienes una cuenta?",
                      style: CustomTextStyle.paragraphStyle,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Crear cuenta",
                      style: CustomTextStyle.paragraphStyle,
                    ),
                  ],
                ),
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
