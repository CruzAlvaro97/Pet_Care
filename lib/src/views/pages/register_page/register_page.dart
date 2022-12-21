import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/providers/login_provider.dart';
import 'package:pet_society/providers/subabase_login_provider.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/services/auth_service.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';
import 'package:provider/provider.dart';

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
class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
    final userProvider = Provider.of<UserProvider>(context);

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
            style: GoogleFonts.poppins(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: formDecorationWidget(
              hintText: 'Ingrese su(s) nombre(s)',
              hintStyle:
                  CustomTextStyle.seeMoreText.copyWith(color: CustomColor.grey),
            ),
            onChanged: ((value) => {
                  userProvider.nombre = value,
                }),
          ),
          //

          const SizedBox(height: 25),
          // LastName header form
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Apellido",
                style: CustomTextStyle.text2.copyWith(color: CustomColor.grey),
              ),
            ],
          ),
          //

          const SizedBox(height: 5),

          // Register lastname form
          TextFormField(
            style: GoogleFonts.poppins(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: formDecorationWidget(
              hintText: 'Ingrese su(s) apellido(s)',
              hintStyle:
                  CustomTextStyle.seeMoreText.copyWith(color: CustomColor.grey),
            ),
            onChanged: ((value) => {
                  userProvider.apellidos = value,
                }),
          ),
          //

          const SizedBox(height: 25),

          // User header form
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Usuario",
                style: CustomTextStyle.text2.copyWith(color: CustomColor.grey),
              ),
            ],
          ),
          //

          const SizedBox(height: 5),

          // Register user form
          TextFormField(
            style: GoogleFonts.poppins(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: formDecorationWidget(
              hintText: (userProvider.nombre == null ||
                      userProvider.apellidos == null)
                  ? 'Ingrese un nombre de usuario'
                  : 'Cree un usuario: ',
              // '${userProvider.nombre}${userProvider.apellidos}'
              hintStyle:
                  CustomTextStyle.seeMoreText.copyWith(color: CustomColor.grey),
            ),
            onChanged: ((value) => {
                  userProvider.usuario = value,
                }),
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
            style: GoogleFonts.poppins(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: formDecorationWidget(
              hintText: 'Ingrese su correo electrónico',
              hintStyle:
                  CustomTextStyle.seeMoreText.copyWith(color: CustomColor.grey),
            ),
            onChanged: ((value) => {
                  loginProvider.email = value,
                  userProvider.email = value,
                }),
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Por favor ingresar un correo válido';
            },
          ),
          //

          const SizedBox(height: 25),

          // Password header form
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Contraseña (mín. 6 caract.)",
                style: CustomTextStyle.text2.copyWith(color: CustomColor.grey),
              ),
            ],
          ),
          //

          const SizedBox(height: 5),

          // Register password form
          TextFormField(
            style: GoogleFonts.poppins(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.text,
            obscureText: _ispassword,
            decoration: formDecorationWidget(
              hintText: 'Ingrese una contraseña',
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
            onChanged: ((value) => {
                  loginProvider.pasword = value,
                }),
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe ser mayor a 6 caracteres.';
            },
          ),
          //

          const SizedBox(height: 64),

          // Register Button
          CustomButtonAuthWidget(
            colorButton: CustomColor.primary,
            onPressed: loginProvider.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();

                    final authService =
                        Provider.of<AuthService>(context, listen: false);

                    if (!loginProvider.isValidForm()) return;
                    loginProvider.isLoading = true;

                    final String? errorMesage = await authService.createUser(
                        loginProvider.email, loginProvider.pasword);

                    if (errorMesage == null) {
                      Navigator.pushReplacementNamed(context, MyRoutes.rHOME);
                      userProvider.guardarDB();
                    } else {
                      loginProvider.isLoading = false;
                    }
                    //
                  },
            child: (loginProvider.isLoading)
                ? CircularProgressIndicator(color: CustomColor.white)
                : Text(
                    'Crear Cuenta',
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

