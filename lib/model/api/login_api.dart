import 'package:capstone/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginAPI {
  static Future<List<LoginModel>> getLogin() async {
    final response = await Dio().get(
        "http://localhost:3000/result");

    List<LoginModel> login = (response.data as List)
        .map((e) => LoginModel(
          id: e['id'], 
          email: e['email'],
          password: e['password'], 
          poin: e['poin'], 
          pin: e['poin']))
        .toList();

    return login;
  }

  static Future postUsers(LoginModel user) async {
    final response =
        await Dio().post("http://localhost:3000/result", data: user.toJson());
    print(response);
    return response.data;
  }
}