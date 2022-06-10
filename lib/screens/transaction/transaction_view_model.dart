import 'package:capstone/model/api/transaction_api.dart';
import 'package:capstone/model/transaction_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/cupertino.dart';

class TransactionViewModel with ChangeNotifier{
  List<TransactionModel> _transaction = [];
  List<TransactionModel> get transaction => _transaction;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  getTransaction() async {
    // changeState(ViewState.loading);

    try {
      final t = await TransactionAPI.getTransaction();
      _transaction = t;
      notifyListeners();
      changeState(ViewState.none);
    } catch (e) {
      changeState(ViewState.error);
    }
  }
}