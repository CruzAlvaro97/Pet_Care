import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;

  void changeStatusFavorite(bool value) {
    _isFavorite = !value;
  }
}
