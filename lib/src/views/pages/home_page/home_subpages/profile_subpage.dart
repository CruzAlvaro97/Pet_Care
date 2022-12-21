// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/providers/login_provider.dart';
import 'package:pet_society/providers/login_provider.dart';
import 'package:pet_society/providers/usuario_provider.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/services/auth_service.dart';
import 'package:pet_society/src/preferences/formadoptation_preferences.dart';
import 'package:pet_society/src/preferences/user_preferences.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/help_page/help_page.dart';
import 'package:provider/provider.dart';

class ProfileSubPage extends StatelessWidget {
  const ProfileSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final authService = Provider.of<AuthService>(context);
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: CustomColor.white2,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  color: CustomColor.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: CircleAvatar(
                            radius: 47,
                            backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2022/01/17/06/52/nature-6944000__340.jpg',
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(110),
                          border:
                              Border.all(width: 3, color: CustomColor.primary),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            // 'Jorgito',
                            '${PreferencesUser.nombreUsuario} ${PreferencesUser.apellidoUsuario}',
                            style: CustomTextStyle.text.copyWith(fontSize: 16),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            'assets/images/Vectorverified.png',
                            scale: 0.8,
                          )
                        ],
                      ),
                      Text(
                        '@${PreferencesUser.usernameUsuario}',
                        style: CustomTextStyle.text
                            .copyWith(fontSize: 14, color: CustomColor.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomColor.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cuenta',
                        style: CustomTextStyle.text.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 5.0),
                      _CustomListTile(
                        tile: 'Datos',
                        prefix: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                          size: 20,
                        ),
                        suffix: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      _CustomListTile(
                        tile: 'Cambiar contraseña',
                        prefix: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                        suffix: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomColor.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preferencias',
                        style: CustomTextStyle.text.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 5.0),
                      _CustomListTile(
                        tile: 'Notificaciones',
                        prefix: Icon(
                          Icons.messenger_outline_sharp,
                          color: Colors.black,
                          size: 20,
                        ),
                        suffix: CupertinoSwitch(
                          value: false,
                          onChanged: (value) {
                            value = !value;
                          },
                        ),
                      ),
                      _CustomListTile(
                        tile: 'Modo oscuro',
                        prefix: Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        suffix: CupertinoSwitch(
                          value: false,
                          onChanged: (value) {
                            value = !value;
                          },
                        ),
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomColor.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ayuda y soporte',
                        style: CustomTextStyle.text.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 5.0),
                      _CustomListTile(
                        tile: 'Ayuda',
                        prefix: Icon(
                          Icons.messenger_outline_sharp,
                          color: Colors.black,
                          size: 20,
                        ),
                        suffix: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const HelpPage(),
                            ),
                          );
                        },
                      ),
                      _CustomListTile(
                        tile: 'Politicas de privacidad',
                        prefix: Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        suffix: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                color: Colors.white,
                child: TextButton(
                  child: Text('Cerrar Sesión',
                      style: CustomTextStyle.text.copyWith(
                        fontSize: 16,
                        color: CustomColor.error,
                      )),
                  onPressed: () {
                    authService.cerrarSesion();
                    loginProvider.isLoading = false;
                    PreferencesUser.id = 0;
                    PreferencesUser.nombreUsuario = '';
                    PreferencesUser.apellidoUsuario = '';
                    PreferencesUser.usernameUsuario = '';
                    PreferencesUser.correoUsuario = '';
                    Navigator.pushReplacementNamed(context, MyRoutes.rWELCOME);
                  },
                ),
              ),
              SizedBox(
                height: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final Widget prefix;
  final String tile;
  final Widget suffix;
  final Function()? onTap;

  const _CustomListTile({
    Key? key,
    required this.prefix,
    required this.tile,
    required this.suffix,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.only(left: 10, right: 10),
      leading: prefix,
      title: Text(
        tile,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: suffix,
    );
  }
}
