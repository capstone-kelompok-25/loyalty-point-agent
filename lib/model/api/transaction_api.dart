import 'package:capstone/model/transaction_model.dart';
import 'package:dio/dio.dart';

class TransactionAPI {

  static Future<EMoneyModel> redeemEmoney(String customerId, String bankProvider, String nomor, String anRekening, String amount, String poinAccount, String poinRedeem) async {
    try {
      final response = await Dio().post("https://api-poins-id.herokuapp.com/v1/emoney", data: {"Customer_id":customerId, "bank_provider":bankProvider, "nomor":nomor, "an_rekening":anRekening, "amount":amount, "poin_account":poinAccount, "poin_redeem":poinRedeem});
      final emoney = EMoneyModel.fromJson(response.data);
      return emoney;
  
    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
  }
}
