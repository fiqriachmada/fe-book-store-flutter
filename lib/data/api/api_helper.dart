import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._privateConstructor();

  static ApiHelper INSTANCE = ApiHelper._privateConstructor();

  final _dio = Dio(BaseOptions(baseUrl: 'http://192.168.1.7:8080'));

  Future<dynamic> postData(String path, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(path, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to post');
      }
    } catch (e) {
      throw Exception('Connection failure');
    }
  }

  Future<dynamic> getData(String path,
      {Map<String, dynamic>? queryParameter}) async {
    try {
      Response response = await _dio.get(path, queryParameters: queryParameter);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed get data');
      }
    } catch (e) {
      print(e);
      throw Exception('Connection failure');
    }
  }
}
