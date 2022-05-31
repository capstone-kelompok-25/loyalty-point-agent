import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  final int? id;
  final String name;
  final String email;
  final String password;
  final String phone;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        phone: json['phone']);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone
      };
}
