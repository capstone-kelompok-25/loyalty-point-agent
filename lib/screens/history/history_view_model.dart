import 'package:capstone/model/api/history_api.dart';
import 'package:capstone/model/history_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/cupertino.dart';

class HistoryViewModel with ChangeNotifier{
  List<Result> _history = [];
  List<Result> get history => _history;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  getHistory(String id) async {
    // changeState(ViewState.loading);

    try {
      final h = await HistoryAPI.getHistory(id);
      _history = h;
      notifyListeners();
      changeState(ViewState.none);
    } catch (e) {
      changeState(ViewState.error);
    }
  }
}