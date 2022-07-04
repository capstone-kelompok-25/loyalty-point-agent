import 'package:capstone/model/api/history_api.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  test('get history return data ', () async {
      String? id;
      var history = await HistoryAPI.getHistory(id!);
      expect(history, true);
    }); 
}