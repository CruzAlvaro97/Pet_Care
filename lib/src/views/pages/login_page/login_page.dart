import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/providers/login_provider.dart';
import 'package:pet_society/providers/usuario_provider.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/services/auth_service.dart';
import 'package:pet_society/src/preferences/formadoptation_preferences.dart';
import 'package:pet_society/src/preferences/user_preferences.dart';
import 'package:pet_society/src/providers/token_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String correo = '';

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
class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _ispassword = true;

  //  Funcionalidad de ocultar contraseña
  void _viewPassword() {
    setState(() {
      _ispassword = !_ispassword;
    });
  }
  //

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final _controller = TextEditingController();

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
            style: GoogleFonts.poppins(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: formDecorationWidget(
              hintText: 'Ingrese su correo electrónico',
              hintStyle:
                  CustomTextStyle.seeMoreText.copyWith(color: CustomColor.grey),
            ),
            //controller: _controller,
            onChanged: ((value) => loginProvider.email = value),
            validator: ((value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Por favor ingresar su correo correctamente';
            }),
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
            style: GoogleFonts.poppins(color: Colors.black),
            autocorrect: false,
            obscureText: _ispassword,
            keyboardType: TextInputType.text,
            decoration: formDecorationWidget(
              hintText: 'Ingrese su contraseña',
              hintStyle:
                  CustomTextStyle.seeMoreText.copyWith(color: CustomColor.grey),
              suffixIcon: InkWell(
                onTap: _viewPassword,
                child: Icon(
                  _ispassword
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: CustomColor.secondary,
                ),
              ),
            ),
            onChanged: (value) => loginProvider.pasword = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe ser mayor a 6 caracteres.';
            },
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

          SizedBox(height: MediaQuery.of(context).size.height * 0.05),

          // Login Button
          CustomButtonAuthWidget(
            colorButton: CustomColor.primary,
            onPressed: (loginProvider.isLoading)
                ? null
                : () async {
                    FocusScope.of(context).unfocus();

                    final authService =
                        Provider.of<AuthService>(context, listen: false);

                    final tokenProvider =
                        Provider.of<TokenProvider>(context, listen: false);

                    // print('error 401');
                    // if (!loginProvider.isValidForm()) return;
                    // print('error 402');
                    loginProvider.isLoading = true;

                    final String? errorMessage = await authService.login(
                      loginProvider.email,
                      loginProvider.pasword,
                    );

                    if (errorMessage == null) {
                      usuarioProvider.getDatauser(loginProvider.email);
                      // ignore: use_build_context_synchronously

                      Future<String> token() async {
                        return await FirebaseMessaging.instance.getToken() ??
                            "";
                      }

                      String token2 = await token();
                      print('Token nuevo => $token2');

                      //loginProvider.email

                      tokenProvider.updateTokenUser(
                          loginProvider.email, token2);

                      Navigator.pushReplacementNamed(context, MyRoutes.rHOME);
                    } else {
                      loginProvider.isLoading = false;
                    }
                  },
            //
            child: (loginProvider.isLoading)
                ? CircularProgressIndicator(color: CustomColor.white)
                : Text(
                    'Iniciar Sesión',
                    style: CustomTextStyle.text2.copyWith(color: Colors.white),
                  ),
          ),
          //
        ],
      ),
    );
  }
}
//

