import 'package:capstone/model/history_model.dart';
import 'package:dio/dio.dart';

class HistoryAPI {
  static Future<List<HistoryModel>> getHistory() async {
    final response = await Dio().get("https://api-dummy.herokuapp.com/v1/history/{id}");

    List<HistoryModel> history = (response.data as List)
        .map((e) => HistoryModel(
            id: e['id'],
            tipe_transaksi: e['tipe_transaksi'],
            tanggal: e['tanggal'],
            status: e['status']))
        .toList();

    return history;
  }
}
