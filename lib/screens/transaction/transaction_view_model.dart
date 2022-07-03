import 'package:capstone/model/api/transaction_api.dart';
import 'package:capstone/model/transaction_model.dart';
import 'package:capstone/model/view_state.dart';
import 'package:flutter/cupertino.dart';

class TransactionViewModel with ChangeNotifier{
  EMoneyModel? _transaction;
  EMoneyModel? get transaction => _transaction;

  List<String> _emoney = [];

  List<String> get emoney => _emoney;

  List<String> _cashout = [];

  List<String> get cashout => _cashout;

  List<String> _pulsa = [];

  List<String> get pulsa => _pulsa;

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  changeState(ViewState s) {
    _state = s;
    notifyListeners();
  }

  Future<String> postTransaction(String customerId, String bankProvider, String nomor, String anRekening, String amount, String poinAccount, String poinRedeem) async {
    changeState(ViewState.loading);

    try {
      print("testpostredeememoney");
      final t = await TransactionAPI.redeemEmoney(customerId, bankProvider, nomor, anRekening, amount, poinAccount, poinRedeem);
      _transaction = t;
      changeState(ViewState.none);
      notifyListeners();
      return "";
    } catch (e) {
      print("testpostredeememoneyerror $e");
      changeState(ViewState.error);
      notifyListeners();
      return "$e";
    }    
  }
}