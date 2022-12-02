import 'package:flutter/material.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        toolbarHeight: 55,
        elevation: 0,
        backgroundColor: CustomColor.white,
        // Back Button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: (() {
            Navigator.pushReplacementNamed(
                context, MyRoutes.rWELCOME); // Preguntar
          }),
        ),
        //
      ),
      //

      // Body
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
                  children: [
                    Text(
                      'Iniciar Sesión',
                      style: CustomTextStyle.headline2,
                    ),
                  ],
                ),
                //

                // Login Description
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Ingresa sus credenciales para acceder a su\ncuenta.",
                        style: CustomTextStyle.textGrey),
                  ],
                ),
                //

                const SizedBox(height: 45),

                // Email header form
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Correo electrónico",
                        style: CustomTextStyle.text2Grey),
                  ],
                ),
                //

                const SizedBox(height: 5),

                // Login email form
                //

                const SizedBox(height: 25),

                // Password header form
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Constraseña", style: CustomTextStyle.text2Grey),
                  ],
                ),
                //

                const SizedBox(height: 5),

                // Login password form
                //

                const SizedBox(height: 20),

                // Forgot password?
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("¿Olvidaste tu constraseña?",
                        style: CustomTextStyle.textPrimary)
                  ],
                ),
                //

                const SizedBox(height: 89),

                // Login Button
                CustomButtonWidget(
                  text: 'Iniciar Sesión',
                  textStyle: CustomTextStyle.text2White,
                  colorButton: CustomColor.primary,
                  onPressed: () {},
                ),
                //

                const SizedBox(height: 96),

                // Register Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("¿No tienes una cuenta?",
                        style: CustomTextStyle.textGrey),
                    const SizedBox(width: 5),
                    Text("Crear cuenta", style: CustomTextStyle.textPrimary),
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
