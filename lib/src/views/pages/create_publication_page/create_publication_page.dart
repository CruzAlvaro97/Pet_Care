// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/form_adoption_pet/form_adoptation_page.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';

class CreatePublicationPage extends StatelessWidget {
  const CreatePublicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Crear publicacion',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Text(
              '¿De qué trata\nsu publicación?',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 7.0),
            Text(
              'Selecciona el tipo publicación que\ndesea crear',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 40.0),
            _CardTypePublication(
              category: 'ADOPCIÓN',
              imgPath: 'assets/icons/casaperroIcon_createPubli.png',
              text: 'Desea dar en adopción\na una mascota',
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const FormAdoptationPage(
                      tipoPost: 'Adopcion',
                    ),
                  ),
                );
              },
            ),
            _CardTypePublication(
              category: 'APOYO',
              imgPath: 'assets/icons/adopcionIcon_createPubli.png',
              text: 'Desea apoyo para una\nmascota',
            ),
            _CardTypePublication(
              category: 'BÚSQUEDA',
              imgPath: 'assets/icons/busquedaIcon_createPubli.png',
              text: 'Está buscando una\nmascota',
            ),
            SizedBox(height: 30.0),
            // Padding(
            //   padding: const EdgeInsets.all(0.0),
            //   child: CustomButtonWidget(
            //     onPressed: () {},
            //     colorButton: CustomColor.primary,
            //     text: 'Continuar',
            //     textStyle:
            //         CustomTextStyle.text2.copyWith(color: CustomColor.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _CardTypePublication extends StatelessWidget {
  final String category;
  final String text;
  final String imgPath;
  final Function()? onTap;

  const _CardTypePublication({
    required this.category,
    required this.text,
    required this.imgPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(0.0, 4.0),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Image.asset(
              imgPath,
              width: 60,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration customInputDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(20.0),
  );
}
