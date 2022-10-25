import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_random_user/models/data.dart';
import 'package:flutter_random_user/models/result.dart';
import 'package:flutter_random_user/utils/loading_status.dart';
import 'package:mobx/mobx.dart';

part 'result_store.g.dart';

class ResultStore = _ResultStore with _$ResultStore;

abstract class _ResultStore with Store {
  Data apiResult = Data();
  Dio dio = Dio();

  Dio get dioConnection {
    dio.options = BaseOptions(connectTimeout: 10000, receiveTimeout: 1000);
    return dio;
  }

  int pageNumber = 0;

  @observable
  List<Result> resultsList = [];

  @observable
  LoadingStatus loadingStatus = LoadingStatus.initial;

  Future<void> upDateResultsList() async {
    pageNumber++;
    log(pageNumber.toString());
    const String baseUrl = 'https://randomuser.me/api/';
    try {
      final response = await dioConnection
          // .get('$baseUrl?format=json&page=1&results=30\$gender=male\$nat=br');
          .get('$baseUrl?format=json&page=$pageNumber&results=30');

      if (response.statusCode == 200) {
        final List<Result> newResults =
            Data.fromJson(response.data).results!;
        resultsList = List.from(resultsList)..addAll(newResults);
      }
    } on DioError catch (e) {
      log(e.response!.statusCode.toString());
    }
  }

  @action
  Future<void> getResult() async {
    const String baseUrl = 'https://randomuser.me/api/';

    loadingStatus = LoadingStatus.loading;

    try {
      final response = await dioConnection
          // .get('$baseUrl?format=json&page=1&results=30\$gender=male\$nat=br');
          .get('$baseUrl?format=json&page=1&results=31');

      if (response.statusCode == 200) {
        apiResult = Data.fromJson(response.data);
        resultsList = apiResult.results!;
        log(jsonEncode(response.data));
        loadingStatus = LoadingStatus.loaded;
      }
    } on DioError catch (e) {
      log(e.response!.statusCode.toString());
      loadingStatus = LoadingStatus.error;
    }
  }
}
