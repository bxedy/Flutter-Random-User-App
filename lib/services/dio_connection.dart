import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio get dioConnection {
  Dio dio = Dio();
  dio.options = BaseOptions(connectTimeout: 10000, receiveTimeout: 1000);
  return dio;
}
