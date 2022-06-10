import 'package:flutter/cupertino.dart';

class HistoryModel with ChangeNotifier{
  int? id;
  String tipe_transaksi;
  String tanggal;
  String status;

  HistoryModel({this.id, required this.tipe_transaksi, required this.tanggal, required this.status});
}