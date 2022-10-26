import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_random_user/models/data.dart';
import 'package:flutter_random_user/models/result.dart';
import 'package:flutter_random_user/services/dio_connection.dart';
import 'package:flutter_random_user/utils/loading_status.dart';
import 'package:mobx/mobx.dart';

part 'result_store.g.dart';

class ResultStore = _ResultStore with _$ResultStore;

abstract class _ResultStore with Store {
  Data apiResult = Data();

  Dio dio = dioConnection;

  int pageNumber = 0;

  @observable
  List<Result> resultsList = [];

  @observable
  List<Result> filteredResultsList = [];

  @action
  filterByName(String val) {
    filteredResultsList = resultsList
        .where((element) => element.name!.first!.toLowerCase().contains(val))
        .toList();
  }

  @action
  filterByGender(String val) {
    filteredResultsList = resultsList
        .where((element) => element.gender!.toLowerCase().startsWith(val))
        .toList();
  }

  @observable
  LoadingStatus loadingStatus = LoadingStatus.initial;

  @action
  Future<void> getResult({required bool isRefresh}) async {
    const String baseUrl = 'https://randomuser.me/api/';

    if (!isRefresh) {
      loadingStatus = LoadingStatus.loading;

      try {
        final response =
            await dioConnection.get('$baseUrl?format=json&page=1&results=31');

        if (response.statusCode == 200) {
          apiResult = Data.fromJson(response.data);
          filteredResultsList = resultsList = apiResult.results!;
          loadingStatus = LoadingStatus.loaded;
        }
      } on DioError catch (e) {
        log(e.response!.statusCode.toString());

        loadingStatus = LoadingStatus.error;
      }
    } else {
      pageNumber++;

      try {
        final response = await dioConnection
            .get('$baseUrl?format=json&page=$pageNumber&results=30');

        if (response.statusCode == 200) {
          final List<Result> newResults = Data.fromJson(response.data).results!;
          filteredResultsList =
              resultsList = List.from(resultsList)..addAll(newResults);
        }
      } on DioError catch (e) {
        log(e.response!.statusCode.toString());
      }
    }
  }
}
