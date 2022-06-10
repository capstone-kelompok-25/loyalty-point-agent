import 'package:capstone/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:swagger_dart_code_generator/swagger_dart_code_generator.dart';

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
            pin: e['pin'],))
        .toList();

    return login;
  }

  static Future postLogin(LoginModel login) async {
    final response = await Dio().post("https://api-dummy.herokuapp.com/v1/login", data: login.toJson());
    print("testlogin");
    print(response.data);
    return response.data;
  }

}