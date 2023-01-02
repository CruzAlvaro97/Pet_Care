import 'package:flutter/material.dart';
import 'package:pet_society/firebase_options.dart';
import 'package:pet_society/providers/detalle_adopcion_provider.dart';
import 'package:pet_society/providers/favorite_provider.dart';
import 'package:pet_society/providers/login_provider.dart';
import 'package:pet_society/providers/subabase_login_provider.dart';
import 'package:pet_society/providers/switch_provider.dart';
import 'package:pet_society/providers/usuario_provider.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/services/auth_service.dart';
import 'package:pet_society/src/preferences/formadoptation_preferences.dart';
import 'package:pet_society/src/preferences/user_preferences.dart';
import 'package:pet_society/src/providers/especie_provider.dart';
import 'package:pet_society/src/providers/publicacion_provider.dart';
import 'package:pet_society/src/providers/raza_provider.dart';
import 'package:pet_society/src/providers/storage_list_images_provider.dart';
import 'package:pet_society/src/providers/token_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:provider/provider.dart';

//====
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:http/http.dart' as http;
//===

///==nuevo
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    //'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}
//===

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await PreferencesUser.init();

  await FirebaseMessaging.instance.subscribeToTopic('myTopic1');

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

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
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => UsuarioProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetalleAdopcionProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TokenProvider(),
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
      initialRoute: MyRoutes.rVERIFY,
      //home: FormAdoptationPage(),
      // scaffoldMessengerKey: CustomSnackbar.msgkey, // SnackBar
      // theme: Provider.of<ThemeProvider>(context).currentTheme, // Modo oscuro
      color: CustomColor.primary,
      theme:
          ThemeData(useMaterial3: false, backgroundColor: CustomColor.white2),
    );
  }
}
