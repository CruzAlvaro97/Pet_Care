import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _img = '';
  static String _name = '';
  static String _lastname = '';
  static String _size = '';
  static String _country = '';
  static int _gender = 1;
  static String _weigth = '';
  static String _age = '';
  static String _number = '';
  static String _email = '';
  static String _role = '';
  static int _breed = 0;
  static String _description = '';
  static bool _theme = false;
  static String _typePost = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //GEt & SET

  //Image
  static String get img {
    return _prefs.getString('img') ?? _img;
  }

  static set img(String img) {
    _img = img;
    _prefs.setString('img', img);
  }

  //Image
  static String get typePost {
    return _prefs.getString('_typePost') ?? _typePost;
  }

  static set typePost(String typePost) {
    _typePost = _typePost;
    _prefs.setString('_typePost', _typePost);
  }

  //Name
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }
  //

  //Lastname
  static String get lastname {
    return _prefs.getString('lastname') ?? _lastname;
  }

  static set lastname(String lastname) {
    _lastname = lastname;
    _prefs.setString('lastname', lastname);
  }
  //

  //Size
  static String get size {
    return _prefs.getString('size') ?? _size;
  }

  static set size(String size) {
    _size = size;
    _prefs.setString('size', size);
  }
  //

  //Country
  static String get country {
    return _prefs.getString('country') ?? _country;
  }

  static set country(String country) {
    _country = country;
    _prefs.setString('country', country);
  }
  //

  //Gender
  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt('gender', gender);
  }

  //Breed
  static int get breed {
    return _prefs.getInt('breed') ?? _breed;
  }

  static set breed(int breed) {
    _breed = breed;
    _prefs.setInt('breed', breed);
  }

  //Weigth
  static String get weigth {
    return _prefs.getString('weigth') ?? _weigth;
  }

  static set weigth(String weigth) {
    _weigth = weigth;
    _prefs.setString('weigth', weigth);
  }

  //Age
  static String get age {
    return _prefs.getString('age') ?? _age;
  }

  static set age(String age) {
    _age = age;
    _prefs.setString('age', age);
  }

  //Number
  static String get number {
    return _prefs.getString('number') ?? _number;
  }

  static set number(String number) {
    _number = number;
    _prefs.setString('number', number);
  }

  //Email
  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set email(String email) {
    _email = email;
    _prefs.setString('email', email);
  }

  //Email
  static String get role {
    return _prefs.getString('role') ?? _role;
  }

  static set role(String role) {
    _role = role;
    _prefs.setString('role', role);
  }

  //Description
  static String get description {
    return _prefs.getString('description') ?? _description;
  }

  static set description(String description) {
    _description = description;
    _prefs.setString('description', description);
  }

  //Theme
  static bool get theme {
    return _prefs.getBool('theme') ?? _theme;
  }

  static set theme(bool theme) {
    _theme = theme;
    _prefs.setBool('theme', theme);
  }
}
