import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('loggedInUser', username);
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedInUser');
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getString('loggedInUser') != null;
    notifyListeners();
  }
}
