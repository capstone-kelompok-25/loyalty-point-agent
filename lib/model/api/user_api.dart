import 'package:capstone/model/user_model.dart';
import 'package:dio/dio.dart';

class UserAPI {
  static Future<List<UserModel>> getUser() async {
    final response = await Dio().get(
        "https://my-json-server.typicode.com/nuruslaily/pelatihan/profile");

    List<UserModel> user = (response.data as List)
        .map((e) => UserModel(
            id: e['id'],
            name: e['name'],
            email: e['email'],
            password: e['password'],
            phone: e['phone']))
        .toList();

    return user;
  }

  static Future postUsers(UserModel user) async {
    final response =
        await Dio().post("http://localhost:3000/profile", data: user.toJson());
    print(response);
    return response.data;
  }
}
