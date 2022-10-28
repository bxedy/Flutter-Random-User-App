import 'package:dio/dio.dart';

Dio get getDioCustomConfig {
  Dio dio = Dio();
  dio.options = BaseOptions(connectTimeout: 10000, receiveTimeout: 1000);
  return dio;
}
