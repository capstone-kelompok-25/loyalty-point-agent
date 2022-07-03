import 'package:capstone/model/register_model.dart';
import 'package:dio/dio.dart';

class RegisterAPI{
  static Future<Result?> postRegister(String email, String password, String fullname, String noHp, String pin) async {
    try {
      final response = await Dio().post("https://api-poins-id.herokuapp.com/v1/customer/register", data: {"email":email, "password":password, "fullname":fullname, "no_hp":noHp, "Pin":pin});
      final register = RegisterModel.fromJson(response.data);
      return register.result;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
  }
  // static Future<Result?> postPINRegister(String pin) async {
  //   try {
  //     final response = await Dio().post("api-poins-id.herokuapp.com/v1/customer/register", data: {"Pin":pin});
  //     final register = RegisterModel.fromJson(response.data);
  //     return register.result;

  //   } on DioError catch (e) {
  //     final defaultError = e.response!.data.toString();
  //     throw defaultError;
  //   }
  // }
}