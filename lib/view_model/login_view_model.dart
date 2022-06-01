import 'package:capstone/model/api/login_api.dart';
import 'package:capstone/model/api/user_api.dart';
import 'package:capstone/model/login_model.dart';
import 'package:capstone/model/user_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel with ChangeNotifier{
  List<LoginModel> _login = [];

  List<LoginModel> get login => _login;

  List<LoginModel> _profile = [];

  List<LoginModel> get profile => _profile;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  getLogin() async {
    // changeState(ViewState.loading);

    try {
      final l = await LoginAPI.getLogin();
      _login = l;
      notifyListeners();
      changeState(ViewState.none);
    } catch (e) {
      changeState(ViewState.error);
    }
  }

  postUser(LoginModel loginModel) async {
    await LoginAPI.postUsers(loginModel);
    // _register.add(userModel);
    notifyListeners();
  }

  void saveUserinStrorage(LoginModel loginModel) {
    _profile.add(loginModel);
    notifyListeners();
  }

  void logout() {
    _profile.clear();
    notifyListeners();
  }
}