import 'package:capstone/model/api/customer_api.dart';
import 'package:capstone/model/customer_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/cupertino.dart';

class ProfileViewModel with ChangeNotifier{
  Result? _profile;

  Result? get profile => _profile;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  Future<String?> updateProfile(String name, String email, String noHp) async {
    changeState(ViewState.loading);

    try {
      print("testpostlogin");
      final p = await CustomerAPI.updateCustomer(name, email, noHp);
      _profile = p;
      print(_profile);
      changeState(ViewState.none);
      notifyListeners();
      return null;
    } catch (e) {
      print("testpostloginerror $e");
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }
    
  }
}