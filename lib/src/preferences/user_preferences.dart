import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  static late SharedPreferences _noprefs;

  static int _id = 0;
  static String _nombreUsuario = '';
  static String _apellidoUsuario = '';
  static String _usernameUsuario = '';
  static String _correoUsuario = '';
  static String _fotoUsuario = '';
  static String _token = '';

  static Future init() async {
    _noprefs = await SharedPreferences.getInstance();
  }

  //GEt & SET

  //ID
  static int get id {
    return _noprefs.getInt('id') ?? _id;
  }

  static set id(int id) {
    _id = id;
    _noprefs.setInt('id', id);
  }

  //Nombre
  static String get nombreUsuario {
    return _noprefs.getString('nombreUsuario') ?? _nombreUsuario;
  }

  static set nombreUsuario(String nombreUsuario) {
    _nombreUsuario = nombreUsuario;
    _noprefs.setString('nombreUsuario', nombreUsuario);
  }
  //

  //Apellido
  static String get apellidoUsuario {
    return _noprefs.getString('apellidoUsuario ') ?? _apellidoUsuario;
  }

  static set apellidoUsuario(String apellidoUsuario) {
    _apellidoUsuario = apellidoUsuario;
    _noprefs.setString('apellidoUsuario ', apellidoUsuario);
  }
  //

  //Usuario
  static String get usernameUsuario {
    return _noprefs.getString('usernameUsuario') ?? _usernameUsuario;
  }

  static set usernameUsuario(String usernameUsuario) {
    _usernameUsuario = usernameUsuario;
    _noprefs.setString('usernameUsuario', usernameUsuario);
  }
  //

  //Correo
  static String get correoUsuario {
    return _noprefs.getString('correoUsuario') ?? _correoUsuario;
  }

  static set correoUsuario(String correoUsuario) {
    _correoUsuario = correoUsuario;
    _noprefs.setString('correoUsuario', correoUsuario);
  }
  //

  //Foto
  static String get fotoUsuario {
    return _noprefs.getString('fotoUsuario') ?? _fotoUsuario;
  }

  static set fotoUsuario(String fotoUsuario) {
    _fotoUsuario = fotoUsuario;
    _noprefs.setString('fotoUsuario', fotoUsuario);
  }
  //

  //Foto
  static String get token {
    return _noprefs.getString('token') ?? _token;
  }

  static set token(String token) {
    _token = token;
    _noprefs.setString('token', token);
  }
  //
}
