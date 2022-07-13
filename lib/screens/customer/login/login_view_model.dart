import 'dart:convert';

import 'package:capstone/model/admin/api/adminlogin_api.dart';
import 'package:capstone/model/api/login_api.dart';
import 'package:capstone/model/login_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:capstone/screens/customer/widget/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel with ChangeNotifier{
  Result? _login;

  Result? get login => _login;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  Future<String?> postLoginCustomer(String email, String password) async {
    changeState(ViewState.loading);

    try {
      print("testpostlogin");
      final l = await LoginAPI.postLogin(email, password);
      _login = l;
      print(_login);
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

  getDataLogin() async {
    SharedPref sharedPref = SharedPref();
    String? email = await sharedPref.read("email");
    return email;
  }
}