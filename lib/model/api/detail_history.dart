import 'package:capstone/model/detail_history_model.dart';
import 'package:capstone/screens/widget/preferences.dart';
import 'package:dio/dio.dart';

class DetailHistoryAPI{
  static Future<Result?> detailHistory(String id_transaction, String token) async {

    try {
      Dio dio = new Dio();
          dio.options.headers["Authorization"] = "Bearer ${token}";
          
      final response = await dio.get("https://api-poins-id.herokuapp.com/v1/dethistory/$id_transaction");
      
      final detailHistory = DetailHistoryModel.fromJson(response.data);
      // print(history.code);
      SharedPref sharedPref = SharedPref();
      sharedPref.save(detailHistory.result!.transactionId, "transaction_id");
      sharedPref.save(detailHistory.result!.transactionType, "transaction_type");
      sharedPref.save(detailHistory.result!.createdat, "createdat");
      sharedPref.save(detailHistory.result!.nomor, "nomor");
      sharedPref.save(detailHistory.result!.description, "description");
      sharedPref.save(detailHistory.result!.amount, "amount");
      sharedPref.save(detailHistory.result!.poinAccount, "poin_account");
      sharedPref.save(detailHistory.result!.poinRedeem, "poin_redeem");
      sharedPref.save(detailHistory.result!.statusTransaction, "status_transaction");
      return detailHistory.result;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
    
  }
}