import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_random_user/models/data.dart';
import 'package:flutter_random_user/models/result.dart';
import 'package:flutter_random_user/services/dio_connection.dart';
import 'package:flutter_random_user/utils/gender_enum.dart';
import 'package:flutter_random_user/utils/loading_status_enum.dart';
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

  @observable
  LoadingStatus loadingStatus = LoadingStatus.initial;

  @observable
  Gender selectedGender = Gender.none;

  @action
  switchGender(Gender gender) {
    selectedGender = gender;
    
    filterByGender();

    if (filteredResultsList.length < 15) {
      getResult(isRefresh: true);
    }
  }

  @action
  filterByName(String val) {
    filteredResultsList = resultsList
        .where((element) => element.name!.first!.toLowerCase().contains(val))
        .toList();
  }

  @action
  filterByGender() {
    filteredResultsList = resultsList
        .where((element) =>
            element.gender!.toLowerCase().startsWith(getSelectedGenderString ?? ''))
        .toList();
  }

  @action
  Future<void> getResult({required bool isRefresh}) async {
    const String baseUrl = 'https://randomuser.me/api/';

    if (!isRefresh) {
      print('1');
      loadingStatus = LoadingStatus.loading;

      try {
        final response =
            await dioConnection.get('$baseUrl?format=json&page=1&results=20');

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
      print('1');

      pageNumber++;

      try {
        log(getSelectedGenderString!);
        final response = await dioConnection.get(
            '$baseUrl?format=json&page=$pageNumber&results=20${getSelectedGenderString != null ? '&gender=$getSelectedGenderString' : ''}');
        log('$baseUrl?format=json&page=$pageNumber&results=20${getSelectedGenderString != null ? '&gender=$getSelectedGenderString' : ''}');
        if (response.statusCode == 200) {
          final List<Result> newResults = Data.fromJson(response.data).results!;
          filteredResultsList =
              resultsList = List.from(filteredResultsList)..addAll(newResults);
        }
      } on DioError catch (e) {
        log(e.response!.statusCode.toString());
      }
    }
  }

  String? get getSelectedGenderString => selectedGender == Gender.male
      ? 'male'
      : selectedGender == Gender.female
          ? 'female'
          : null;
}
