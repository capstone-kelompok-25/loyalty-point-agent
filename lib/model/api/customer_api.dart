import 'package:capstone/model/customer_model.dart';
import 'package:dio/dio.dart';

class CustomerAPI{
  static Future<Result?> updateCustomer(String name, String email, String noHp) async {

    try {
      final response = await Dio().put("api-poins-id.herokuapp.com/v1/customer", data: {"name":name,"email": email, "no_hp": noHp});
      final customer = CustomerModel.fromJson(response.data);
      return customer.result;

    } on DioError catch (e) {
      final defaultError = e.response!.data.toString();
      throw defaultError;
    }
    
  }
}