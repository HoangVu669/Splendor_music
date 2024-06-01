import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? username;

  void setUser(String name) {
    username = name;
    notifyListeners();
  }
}
