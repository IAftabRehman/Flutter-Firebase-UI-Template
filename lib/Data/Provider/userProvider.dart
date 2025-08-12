import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _name;
  String? _profileImage;

  String? get name => _name;
  String? get profileImage => _profileImage;

  void setUser(String name, String profileImage) {
    _name = name;
    _profileImage = profileImage;
    notifyListeners();
  }
}
