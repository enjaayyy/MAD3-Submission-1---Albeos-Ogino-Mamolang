import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccount {
  
  final String username;
  final String password;

  UserAccount({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username' : username,
      'password' : password,
    };
  }


}

