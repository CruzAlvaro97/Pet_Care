import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                // Register Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Crear cuenta',
                      style: CustomTextStyle.headline2,
                    ),
                  ],
                ),
                //

                const SizedBox(height: 10),

                // Register Description
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Crea una cuenta para unirte\na la comunidad.",
                      style: CustomTextStyle.title
                          .copyWith(color: CustomColor.grey),
                    ),
                  ],
                ),
                //

                const SizedBox(height: 40),

                // Name header form
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Nombre",
                      style: CustomTextStyle.title
                          .copyWith(color: CustomColor.grey),
                    ),
                  ],
                ),
                //

                const SizedBox(height: 5),

                // Register name form
                //

                const SizedBox(height: 20),

                // Email header form
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Email",
                      style: CustomTextStyle.title
                          .copyWith(color: CustomColor.grey),
                    ),
                  ],
                ),
                //

                const SizedBox(height: 5),

                // Register email form
                //

                const SizedBox(height: 20),

                // Password header form
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Contraseña",
                      style: CustomTextStyle.title
                          .copyWith(color: CustomColor.grey),
                    ),
                  ],
                ),
                //

                const SizedBox(height: 5),

                // Register password form
                //

                const SizedBox(height: 30),

                // Register Button
                CustomButtonWidget(
                  text: 'Crear cuenta',
                  textStyle:
                      CustomTextStyle.title.copyWith(color: Colors.white),
                  colorButton: CustomColor.primary,
                  onPressed: () {},
                ),
                //

                const SizedBox(height: 40),

                // Login Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "¿Ya tienes una cuenta?",
                      style: CustomTextStyle.title
                          .copyWith(color: CustomColor.grey),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Iniciar Sesión",
                      style: CustomTextStyle.title
                          .copyWith(color: CustomColor.primary),
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
