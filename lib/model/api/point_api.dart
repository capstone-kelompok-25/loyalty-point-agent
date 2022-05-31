import 'package:dio/dio.dart';
import 'package:capstone/model/point_model.dart';

class PointAPI {
  Future<List<Point>> getPoint() async {
    final response = await Dio().get(
        "https://my-json-server.typicode.com/nuruslaily/pelatihan/point");

    List<Point> point = (response.data as List)
        .map((e) => Point(
          e['id'], 
          name: e['name'], 
          date: e['date'], 
          total_point: e['total_point'], 
          no_telp: e['no_telp']))
        .toList();

    return point;
  }

  Future postUsers(Point point) async {
    final response =
        await Dio().post("http://localhost:3000/point", data: point.toJson());
    print(response);
    return response.data;
  }
}