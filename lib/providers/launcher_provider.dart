import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LauncherProvider extends ChangeNotifier {
  //WHATSAPP
  void goWhatsappLauncher() async {
    String phone = '+51962148767';
    String msg = '¡Feliz Navidad!';

    String urlEncode = Uri.encodeFull('https://wa.me/$phone?text=$msg');

    if (await canLaunchUrlString(urlEncode)) {
      await launchUrlString(
        urlEncode,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
