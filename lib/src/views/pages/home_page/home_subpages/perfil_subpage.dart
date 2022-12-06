// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        bottomRight: Radius.circular(20))),
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
                            'Jorge Moreno',
                            style: CustomTextStyle.text.copyWith(fontSize: 20),
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
                        '@jorgeo2r2_',
                        style: CustomTextStyle.text
                            .copyWith(fontSize: 18, color: CustomColor.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomColor.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cuenta',
                        style: CustomTextStyle.text.copyWith(fontSize: 22),
                      ),
                      _CustomListTile(
                        tile: 'Datos',
                        prefix: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                          size: 32,
                        ),
                        suffix: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                        ),
                      ),
                      _CustomListTile(
                        tile: 'Cambir contraseña',
                        prefix: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.black,
                          size: 32,
                        ),
                        suffix: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                        ),
                      ),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preferencias',
                        style: CustomTextStyle.text.copyWith(fontSize: 22),
                      ),
                      _CustomListTile(
                        tile: 'Notificaciones',
                        prefix: Icon(
                          Icons.messenger_outline_sharp,
                          color: Colors.black,
                          size: 32,
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
                          size: 32,
                        ),
                        suffix: CupertinoSwitch(
                          value: false,
                          onChanged: (value) {
                            value = !value;
                          },
                        ),
                      ),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ayuda y soporte',
                        style: CustomTextStyle.text.copyWith(fontSize: 22),
                      ),
                      _CustomListTile(
                        tile: 'Ayuda',
                        prefix: Icon(
                          Icons.messenger_outline_sharp,
                          color: Colors.black,
                          size: 32,
                        ),
                        suffix: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                        ),
                      ),
                      _CustomListTile(
                        tile: 'Politicas de privacidad',
                        prefix: Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.black,
                          size: 32,
                        ),
                        suffix: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                color: Colors.white,
                child: TextButton(
                  child: Text('Cerrar Sesión',
                      style: CustomTextStyle.text.copyWith(
                        fontSize: 20,
                        color: CustomColor.error,
                      )),
                  onPressed: () {},
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
  const _CustomListTile({
    Key? key,
    required this.prefix,
    required this.tile,
    required this.suffix,
  }) : super(key: key);
  final Widget prefix;
  final String tile;
  final Widget suffix;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: prefix,
      title: Text(
        tile,
        style: CustomTextStyle.text2.copyWith(fontSize: 20),
      ),
      trailing: suffix,
    );
  }
}
