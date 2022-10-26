// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResultStore on _ResultStore, Store {
  late final _$resultsListAtom =
      Atom(name: '_ResultStore.resultsList', context: context);

  @override
  List<Result> get resultsList {
    _$resultsListAtom.reportRead();
    return super.resultsList;
  }

  @override
  set resultsList(List<Result> value) {
    _$resultsListAtom.reportWrite(value, super.resultsList, () {
      super.resultsList = value;
    });
  }

  late final _$filteredResultsListAtom =
      Atom(name: '_ResultStore.filteredResultsList', context: context);

  @override
  List<Result> get filteredResultsList {
    _$filteredResultsListAtom.reportRead();
    return super.filteredResultsList;
  }

  @override
  set filteredResultsList(List<Result> value) {
    _$filteredResultsListAtom.reportWrite(value, super.filteredResultsList, () {
      super.filteredResultsList = value;
    });
  }

  late final _$loadingStatusAtom =
      Atom(name: '_ResultStore.loadingStatus', context: context);

  @override
  LoadingStatus get loadingStatus {
    _$loadingStatusAtom.reportRead();
    return super.loadingStatus;
  }

  @override
  set loadingStatus(LoadingStatus value) {
    _$loadingStatusAtom.reportWrite(value, super.loadingStatus, () {
      super.loadingStatus = value;
    });
  }

  late final _$getResultAsyncAction =
      AsyncAction('_ResultStore.getResult', context: context);

  @override
  Future<void> getResult({required bool isRefresh}) {
    return _$getResultAsyncAction
        .run(() => super.getResult(isRefresh: isRefresh));
  }

  late final _$_ResultStoreActionController =
      ActionController(name: '_ResultStore', context: context);

  @override
  dynamic filterByName(String val) {
    final _$actionInfo = _$_ResultStoreActionController.startAction(
        name: '_ResultStore.filterByName');
    try {
      return super.filterByName(val);
    } finally {
      _$_ResultStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterByGender(String val) {
    final _$actionInfo = _$_ResultStoreActionController.startAction(
        name: '_ResultStore.filterByGender');
    try {
      return super.filterByGender(val);
    } finally {
      _$_ResultStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
resultsList: ${resultsList},
filteredResultsList: ${filteredResultsList},
loadingStatus: ${loadingStatus}
    ''';
  }
}
