import 'package:dio/dio.dart';

class ApiService {
  const ApiService(this.dio);

  final Dio dio;
  static const List<int> successfulStatus = <int>[200,201];

  Future<Response<dynamic>> get({
    required String path,
    Object? data,
    Map<String,dynamic>? queryParams,
    Options? options,
  }) {
    return dio.get(path, data: data, options: options, queryParameters: queryParams);
  }

  Future<Response<dynamic>> post({
    required String path,
    Object? data,
    Map<String,dynamic>? queryParams,
    Options? options,
  }) {
    return dio.post(path, data: data, options: options, queryParameters: queryParams);
  }
}