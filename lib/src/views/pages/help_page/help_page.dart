// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_society/src/views/pages/help_page/sugestion_page.dart/suggestion_page.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Centro de ayuda',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,
                CupertinoPageRoute(builder: (context) => const HelpPage()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '¿En qué podemos\nayudarle?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              _CardTypePublication(
                category: 'Envia una sugerencia',
                imgPath: 'assets/images/sugerencia.png',
                text: 'Tu opinión es importante, y\nmejorará tu experiencia.',
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const SuggestionPage()));
                },
              ),
              _CardTypePublication(
                category: 'Atención al cliente',
                imgPath: 'assets/images/wsp.png',
                text:
                    'Contáctanos vía WhatsApp,\npara una atención más\npersonalizada.',
                onTap: () {
                  print('WhatsApp');
                },
              ),
              _CardTypePublication(
                category: 'Preguntas frecuentes',
                imgPath: 'assets/images/preguntas.png',
                text: 'Lorem Ipsum is simply\ntext of the printing.',
                onTap: () {
                  print('FAQ');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardTypePublication extends StatelessWidget {
  final String category;
  final String text;
  final String imgPath;
  final Function() onTap;

  const _CardTypePublication({
    required this.category,
    required this.text,
    required this.imgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        //height: 120,
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 30.0,
        ),
        margin: const EdgeInsets.only(bottom: 15.0),
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Color(0xFF6444E7),
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  text,
                  style: const TextStyle(
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
