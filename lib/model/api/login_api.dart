import 'package:capstone/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginAPI {

  static Future<Result?> postLogin(Result login) async {
    // final response = await Dio().post("https://api-dummy.herokuapp.com/v1/login", data: login.toJson());
    // print("testlogin");
    // print(response.data);
    // return response.data;
    try {
      final response = await Dio().post("https://api-dummy.herokuapp.com/v1/login");
      final login = LoginModel.fromJson(response.data);
      return login.result;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
  }

}