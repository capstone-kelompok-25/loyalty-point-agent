import 'package:capstone/model/transaction_model.dart';
import 'package:dio/dio.dart';

class TransactionAPI {
  static Future<List<TransactionModel>> getTransaction() async {
    final response = await Dio().get("https://api-dummy.herokuapp.com/v1/detailhistory/{id}");

    List<TransactionModel> transaction = (response.data as List)
        .map((e) => TransactionModel(
            id: e['id'],
            jenis_transaction: e['jenis_transaction'],
            nama_bank: e['nama_bank'],
            no_rekening: e['no_rekening'],
            poin_account: e['poin_account'],
            poin_redeem: e['poin_redeem']))
        .toList();

    return transaction;
  }
}
