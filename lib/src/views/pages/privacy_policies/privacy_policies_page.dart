import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPoliciesPage extends StatelessWidget {
  const PrivacyPoliciesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.primary,
        title: Text(
          'Políticas de Privacidad',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: const WebView(
        initialUrl: 'https://pet-care-app.netlify.app/',
      ),
    );
  }
}
