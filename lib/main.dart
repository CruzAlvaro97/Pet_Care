import 'package:flutter/material.dart';
import 'package:pet_society/providers/switch_provider.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    //ChangeNotifierProvider(create: (_) => CambioProvider()),
    ChangeNotifierProvider(create: (_) => CambioProviderAdopcion()),
    ChangeNotifierProvider(create: (_) => CambioProviderHelp()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: App.name,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rHOME,
      // scaffoldMessengerKey: CustomSnackbar.msgkey, // SnackBar
      // theme: Provider.of<ThemeProvider>(context).currentTheme, // Modo oscuro
      color: CustomColor.primary,
      theme:
          ThemeData(useMaterial3: false, backgroundColor: CustomColor.white2),
    );
  }
}
