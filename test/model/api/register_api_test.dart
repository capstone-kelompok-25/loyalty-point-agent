import 'package:capstone/model/api/register_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    test('post register return result ', () async {
      String? email; 
      String? password; 
      String? fullname; 
      String? noHp; 
      int? pin;
      var register = await RegisterAPI.postRegisterAPI(
          email!, password!, fullname!, noHp!, pin!);
      expect(register!.email, true);
      expect(register.password, true);
      expect(register.fullname, true);
      expect(register.noHp, true);
      expect(register.pin, true);
    });
  
}
