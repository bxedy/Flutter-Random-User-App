import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_random_user/components/custom_snack_bar.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_random_user/models/result.dart';
import 'package:flutter_random_user/services/dio_custom_config_getter.dart';
import 'package:flutter_random_user/utils/gender_enum.dart';
import 'package:flutter_random_user/utils/internet_checker.dart';
import 'package:flutter_random_user/utils/loading_status_enum.dart';

part 'random_users_store.g.dart';

// ignore: library_private_types_in_public_api
class RandomUsersStore = _RandomUsersStore with _$RandomUsersStore;

abstract class _RandomUsersStore with Store {
  Dio dio = getDioCustomConfig;

  int pageNumber = 0;

  @observable
  List<Result> resultsList = [];

  @observable
  List<Result> filteredResultsList = [];

  @observable
  LoadingStatus loadingStatus = LoadingStatus.initial;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @observable
  Gender selectedGender = Gender.none;

  @action
  switchGender(BuildContext context, Gender gender) {
    if (selectedGender == gender) {
      undoGenderFilter();
      return;
    }

    selectedGender = gender;

    filterByGender();

    if (filteredResultsList.length < 15) {
      getData(context, isRefresh: true);
    }
  }

  undoGenderFilter() {
    selectedGender = Gender.none;
    filteredResultsList = resultsList;
  }

  getData(context, {required bool isRefresh}) async {
    final bool hasInternet = await checkConnection();
    if (hasInternet) {
      getDataFromInternet(isRefresh: isRefresh);
    } else if (!hasInternet && !isRefresh) {
      getDataFromCache();
      showCustomSnackBar(context, 'Não há conexão com a internet');
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
        .where((element) => element.gender!
            .toLowerCase()
            .startsWith(getSelectedGenderString ?? ''))
        .toList();
  }

  @action
  Future<void> getDataFromInternet({required bool isRefresh}) async {
    const String baseUrl = 'https://randomuser.me/api/';

    if (isRefresh == false) {
      loadingStatus = LoadingStatus.loading;

      try {
        final response = await getDioCustomConfig
            .get('$baseUrl?format=json&page=1&results=20');

        if (response.statusCode == 200) {
          filteredResultsList = resultsList = response.data["results"]
              .map<Result>((json) => Result.fromJson(json))
              .toList();

          loadingStatus = LoadingStatus.loaded;

          setCacheData();
        }
      } on DioError catch (e) {
        loadingStatus = LoadingStatus.error;
        log(e.toString());
      }
    } else {
      pageNumber++;

      try {
        final response = await getDioCustomConfig.get(
            '$baseUrl?format=json&page=$pageNumber&results=20${getSelectedGenderString != null ? '&gender=$getSelectedGenderString' : ''}');
        if (response.statusCode == 200) {
          final List<Result> newPageResponse = response.data["results"]
              .map<Result>((json) => Result.fromJson(json))
              .toList();

          if (selectedGender == Gender.none) {
            filteredResultsList = resultsList =
                filteredResultsList + resultsList + newPageResponse;
          } else {
            filteredResultsList = resultsList = List.from(filteredResultsList)
              ..addAll(newPageResponse);
          }
          setCacheData();
        }
      } on DioError catch (e) {
        log(e.response!.statusCode.toString());
      }
    }
  }

  void setCacheData() async {
    debugPrint("Setando o cache");
    Database database = await openDatabase('data_database.db', version: 1,
        onCreate: (database, version) async {
      await database.execute(
          'CREATE TABLE data_table (id INTEGER PRIMARY KEY, value TEXT)');
    }, onOpen: (database) async {
      await database.rawQuery("DELETE FROM data_table");
    });

    for (var data in resultsList) {
      await database.insert("data_table", {
        "value": jsonEncode(data.toJson()),
      });
    }
    debugPrint("Banco setado");
    await database.close();
  }

  @action
  getDataFromCache() async {
    loadingStatus = LoadingStatus.loading;
    Database database = await openDatabase('data_database.db', version: 1);
    List cachedUsersDataList = await database.rawQuery("SELECT * FROM data_table;");
    for (var data in cachedUsersDataList) {
      resultsList.add(Result.fromJson(jsonDecode(data['value'])));
    }
    filteredResultsList = resultsList;
    loadingStatus = LoadingStatus.loaded;
    await database.close();
  }

  String? get getSelectedGenderString => selectedGender == Gender.male
      ? 'male'
      : selectedGender == Gender.female
          ? 'female'
          : null;
}
