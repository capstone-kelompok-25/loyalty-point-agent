import 'package:capstone/model/api/login_api.dart';
import 'package:capstone/model/api/user_api.dart';
import 'package:capstone/model/login_model.dart';
import 'package:capstone/model/user_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel with ChangeNotifier{
  List<Result> _login = [];

  List<Result> get login => _login;

  final List<Result> _profile = [];

  List<Result> get profile => _profile;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  postLogin(Result login) async {
    // changeState(ViewState.loading);

    try {
      print("testpostlogin");
      final l = await LoginAPI.postLogin(login);
      _login = l as List<Result>;
      notifyListeners();
      changeState(ViewState.none);
    } catch (e) {
      print("testpostloginerror $e");
      changeState(ViewState.error);
    }
  }

  // postUser(LoginModel loginModel) async {
  //   await LoginAPI.postUsers(loginModel);
  //   // _register.add(userModel);
  //   notifyListeners();
  // }

  // void saveUserinStrorage(LoginModel loginModel) {
  //   _profile.add(loginModel);
  //   notifyListeners();
  // }

  void logout() {
    _profile.clear();
    notifyListeners();
  }
}