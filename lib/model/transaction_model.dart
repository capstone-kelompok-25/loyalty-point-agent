import 'package:flutter/cupertino.dart';

class TransactionModel with ChangeNotifier{
  int? id;
  String jenis_transaction;
  String nama_bank;
  int no_rekening;
  int? poin_account;
  int? poin_redeem;
  
  TransactionModel({this.id, required this.jenis_transaction, required this.nama_bank, required this.no_rekening, this.poin_account, this.poin_redeem});
}