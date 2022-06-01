import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier {
  final int? id;
  final String email;
  final String password;
  final num? poin;
  final num? pin;

  LoginModel(
    {this.id, 
  required this.email, 
  required this.password,
  this.poin,
  this.pin});

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password
      };
}