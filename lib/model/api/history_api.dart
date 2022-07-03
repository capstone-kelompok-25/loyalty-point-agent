import 'package:capstone/model/history_model.dart';
import 'package:dio/dio.dart';

class HistoryAPI {
  static Future<List<Result>> getHistory(String id) async {

    try {
      final response = await Dio().get("api-poins-id.herokuapp.com/v1/history/$id");
      final history = HistoryModel.fromJson(response.data);
      return history.result!;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
    
  }
}
