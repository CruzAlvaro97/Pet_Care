import 'package:flutter/material.dart';
import 'package:pet_society/providers/favorite_provider.dart';
import 'package:pet_society/providers/switch_provider.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/src/preferences/formadoptation_preferences.dart';
import 'package:pet_society/src/providers/especie_provider.dart';
import 'package:pet_society/src/providers/publicacion_provider.dart';
import 'package:pet_society/src/providers/raza_provider.dart';
import 'package:pet_society/src/providers/storage_list_images_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/form_adoption_pet/paso3.dart';
import 'package:provider/provider.dart';

import 'src/views/pages/form_adoption_pet/form_adoptation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PublicacionProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => EspecieProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => RazaProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => StorageListImagesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CambioProviderAdopcion(),
        ),
        ChangeNotifierProvider(
          create: (context) => CambioProviderHelp(),
        ),
      ],
      child: const MyApp(),
    );
  }
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
      //home: FormAdoptationPage(),
      // scaffoldMessengerKey: CustomSnackbar.msgkey, // SnackBar
      // theme: Provider.of<ThemeProvider>(context).currentTheme, // Modo oscuro
      color: CustomColor.primary,
      theme:
          ThemeData(useMaterial3: false, backgroundColor: CustomColor.white2),
    );
  }
}
