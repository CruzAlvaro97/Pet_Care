import 'package:flutter/material.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: (() {
            Navigator.pushNamed(context, MyRoutes.rWELCOME); // Preguntar
          }),
        ),
        //
      ),
      //

      //Body
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
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

                  // Register Description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Crea una cuenta para unirte a la comunidad.",
                          style: CustomTextStyle.text
                              .copyWith(color: CustomColor.grey),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  //

                  const SizedBox(height: 45),

                  //
                  const RegisterForm(),
                  //
                ],
              ),
            ),
          ],
        ),
      ),
      //

      //BottomSheet
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: 80,
        child:
            // Login Option
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "¿Ya tienes una cuenta?",
              style: CustomTextStyle.text.copyWith(color: CustomColor.grey),
            ),
            TextButton(
              style: textButtonDecorationWidget(),
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.rLOGIN);
              },
              child: Text(
                "Iniciar Sesión",
                style:
                    CustomTextStyle.text.copyWith(color: CustomColor.primary),
              ),
            ),
          ],
        ),
        //,
      ),
      //
    );
  }
}
//

// Register form
class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Name header form
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Nombre",
                style: CustomTextStyle.text2.copyWith(color: CustomColor.grey),
              ),
            ],
          ),
          //

          const SizedBox(height: 5),

          // Register name form
          TextFormField(
            style: TextStyle(color: CustomColor.black),
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: formDecorationWidget(
              hintText: 'Ingrese su nombre',
            ),
          ),
          //

          const SizedBox(height: 25),

          // Email header form
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Correo Electrónico",
                style: CustomTextStyle.text2.copyWith(color: CustomColor.grey),
              ),
            ],
          ),
          //

          const SizedBox(height: 5),

          // Register email form
          TextFormField(
            style: TextStyle(color: CustomColor.black),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: formDecorationWidget(
              hintText: 'Ingrese su correo electrónico',
            ),
          ),
          //

          const SizedBox(height: 25),

          // Password header form
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Contraseña",
                style: CustomTextStyle.text2.copyWith(color: CustomColor.grey),
              ),
            ],
          ),
          //

          const SizedBox(height: 5),

          // Register password form
          TextFormField(
            style: TextStyle(color: CustomColor.black),
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: formDecorationWidget(
              hintText: 'Ingrese una contraseña',
            ),
          ),
          //

          const SizedBox(height: 64),

          // Register Button
          CustomButtonWidget(
            text: 'Crear cuenta',
            textStyle: CustomTextStyle.text2.copyWith(color: Colors.white),
            colorButton: CustomColor.primary,
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.rHOME);
            },
          ),
          //
        ],
      ),
    );
  }
}
//

