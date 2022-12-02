import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/index_pages.dart';
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
                Text(App.name, style: CustomTextStyle.welcome.copyWith()),
                //

                const SizedBox(height: 23),

                // Welcome Image
                // const SizedBox(
                //   width: double.infinity,
                //   height: 268,
                //   child: Expanded(
                //       child: Image(
                //     image: AssetImage('assets/images/welcome.png'),
                //     fit: BoxFit.fitWidth,
                //   )),
                // ),

                Image.asset('assets/images/welcome.png'),
                //

                const SizedBox(height: 23),

                // Welcome Description
                Text(
                  "La comunidad dónde buscamos mejorar la calidad de vida de las mascotas",
                  style: CustomTextStyle.text,
                  textAlign: TextAlign.center,
                ),
                //

                const SizedBox(height: 48),

                // Login Button
                CustomButtonWidget(
                  text: 'Iniciar Sesión',
                  textStyle: CustomTextStyle.text2White,
                  colorButton: CustomColor.primary,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, MyRoutes.rLOGIN);
                  },
                ),
                //

                const SizedBox(height: 10),

                // Register Button
                CustomButtonWidget(
                  text: 'Crear cuenta',
                  textStyle: CustomTextStyle.text2Primary,
                  colorButton: CustomColor.white,
                  onPressed: () {
                    // Navigator.pushReplacementNamed(
                    //     context, MyRoutes.rRESGISTER);
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const RegisterPage(),
                        ));
                  },
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
