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
            Navigator.pushNamed(context, MyRoutes.rWELCOME); // Preguntar
          }),
        ),
        //
      ),
      //

      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Ingresa sus credenciales para acceder a su cuenta.",
                        style: CustomTextStyle.text
                            .copyWith(color: CustomColor.grey),
                      ),
                    ],
                  ),
                  //

                  const SizedBox(height: 45),

                  // Login Form
                  const LoginForm(),
                  //
                ],
              ),
            ],
          ),
        ),
      ),
      //

      //BottomSheet
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: 80,
        child:
            // Register Option
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("¿No tienes una cuenta?",
                style: CustomTextStyle.text.copyWith(color: CustomColor.grey)),
            const SizedBox(width: 5),
            TextButton(
              style: textButtonDecorationWidget(),
              onPressed: (() {
                Navigator.pushNamed(context, MyRoutes.rRESGISTER);
              }),
              child: Text("Crear cuenta",
                  style: CustomTextStyle.text
                      .copyWith(color: CustomColor.primary)),
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

// Login form
class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Email header form
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Correo electrónico",
                  style:
                      CustomTextStyle.text2.copyWith(color: CustomColor.grey)),
            ],
          ),
          //

          const SizedBox(height: 5),

          // Login email form
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
              Text("Constraseña",
                  style:
                      CustomTextStyle.text2.copyWith(color: CustomColor.grey)),
            ],
          ),
          //

          const SizedBox(height: 5),

          // Login password form
          TextFormField(
            style: TextStyle(color: CustomColor.black),
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: formDecorationWidget(
              hintText: 'Ingrese su contraseña',
            ),
          ),
          //

          const SizedBox(height: 20),

          // Forgot password?
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("¿Olvidaste tu constraseña?",
                  style:
                      CustomTextStyle.text.copyWith(color: CustomColor.primary))
            ],
          ),
          //

          const SizedBox(height: 89),

          // Login Button
          CustomButtonWidget(
            text: 'Iniciar Sesión',
            textStyle: CustomTextStyle.text2.copyWith(color: CustomColor.white),
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
