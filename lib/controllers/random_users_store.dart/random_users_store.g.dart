// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RandomUsersStore on _RandomUsersStore, Store {
  late final _$resultsListAtom =
      Atom(name: '_RandomUsersStore.resultsList', context: context);

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
      Atom(name: '_RandomUsersStore.filteredResultsList', context: context);

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
      Atom(name: '_RandomUsersStore.loadingStatus', context: context);

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

  late final _$selectedGenderAtom =
      Atom(name: '_RandomUsersStore.selectedGender', context: context);

  @override
  Gender get selectedGender {
    _$selectedGenderAtom.reportRead();
    return super.selectedGender;
  }

  @override
  set selectedGender(Gender value) {
    _$selectedGenderAtom.reportWrite(value, super.selectedGender, () {
      super.selectedGender = value;
    });
  }

  late final _$getDataFromInternetAsyncAction =
      AsyncAction('_RandomUsersStore.getDataFromInternet', context: context);

  @override
  Future<void> getDataFromInternet({required bool isRefresh}) {
    return _$getDataFromInternetAsyncAction
        .run(() => super.getDataFromInternet(isRefresh: isRefresh));
  }

  late final _$getDataFromCacheAsyncAction =
      AsyncAction('_RandomUsersStore.getDataFromCache', context: context);

  @override
  Future<void> getDataFromCache() {
    return _$getDataFromCacheAsyncAction.run(() => super.getDataFromCache());
  }

  late final _$_RandomUsersStoreActionController =
      ActionController(name: '_RandomUsersStore', context: context);

  @override
  void filterByName(String val) {
    final _$actionInfo = _$_RandomUsersStoreActionController.startAction(
        name: '_RandomUsersStore.filterByName');
    try {
      return super.filterByName(val);
    } finally {
      _$_RandomUsersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByGender() {
    final _$actionInfo = _$_RandomUsersStoreActionController.startAction(
        name: '_RandomUsersStore.filterByGender');
    try {
      return super.filterByGender();
    } finally {
      _$_RandomUsersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchGender(BuildContext context, Gender gender) {
    final _$actionInfo = _$_RandomUsersStoreActionController.startAction(
        name: '_RandomUsersStore.switchGender');
    try {
      return super.switchGender(context, gender);
    } finally {
      _$_RandomUsersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
resultsList: ${resultsList},
filteredResultsList: ${filteredResultsList},
loadingStatus: ${loadingStatus},
selectedGender: ${selectedGender}
    ''';
  }
}
