import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Welcome Header
                Text(
                  App.name,
                  style: CustomTextStyle.headerStyle,
                ),
                //

                const SizedBox(height: 10),

                // Welcome Image
                const SizedBox(
                  width: double.infinity,
                  height: 250,
                  // child: Text('Imagen'),
                  child: Expanded(
                      child: Image(
                    image: AssetImage('assets/images/welcome.png'),
                    fit: BoxFit.fitWidth,
                  )),
                ),
                //

                const SizedBox(height: 10),

                // Welcome Description
                Text(
                  "La comunidad dónde buscamos mejorar \n la calidad de vida de las mascotas",
                  style: CustomTextStyle.paragraphStyle,
                  textAlign: TextAlign.center,
                ),
                //

                const SizedBox(height: 20),

                // Login Buton
                CustomButtonPurpleWidget(
                  text: 'Iniciar Sesión',
                  textStyle: CustomTextStyle.buttonStyleWhite,
                  onPressed: () {},
                ),
                //

                const SizedBox(height: 10),

                // Register Buton
                CustomButtonWhiteWidget(
                  text: 'Registrarse',
                  textStyle: CustomTextStyle.buttonStylePurple,
                  onPressed: () {},
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
