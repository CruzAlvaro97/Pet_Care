import 'package:flutter/material.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages/perfil_subpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: App.name,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rONBOARDING,
      // scaffoldMessengerKey: CustomSnackbar.msgkey, // SnackBar
      // theme: Provider.of<ThemeProvider>(context).currentTheme, // Modo oscuro
      color: CustomColor.primary,
      theme: ThemeData(useMaterial3: true, backgroundColor: CustomColor.white2),
    );
  }
}
