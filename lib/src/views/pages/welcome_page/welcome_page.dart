import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 25),
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
                  child: Text('Imagen'),
                  // child: Expanded(child: Image(image: NetworkImage('url'))),
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

                const SizedBox(height: 10),

                // Login Buton
                //

                // Register Buton
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
