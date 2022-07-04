import 'package:capstone/model/api/login_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('post login return result ', () async {
      String? email;
      String? password;
      var login = await LoginAPI.postLogin(email!, password!);
      expect(login!.email, true);
      expect(login.password, true);
    }); 
}