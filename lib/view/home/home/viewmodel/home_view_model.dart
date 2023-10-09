import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  // ignore: prefer_typing_uninitialized_variables

  @override
  void setContext(BuildContext? context) => context = context;

  void init() {
    dropdownValue = values.first;
    indexxx;
    setValue(value: 0);
  }
  @observable
  int? index;
  @computed
  int? get indexxx => this.index;
  @observable
  bool isLoading = false;
  @observable
  List<String> values = [
    'Cari Cart',
    'Pomvardimas',
    'Marsatmas',
  ];
  @action
  int? setValue({int? value}) {
    if (value != null) {
      index = value;
    }
    debugPrint("mboxxvalueee:`$index`");
    debugPrint("newmobxvaluesss:`$indexxx`");
    return index;
  }

  @observable
  String? dropdownValue;
}




 /*  @action
  int? setValue({int? value}) {
    if (value != null) {
      index = value;
    }
    // debugPrint("mboxxvalueee:`$index`");
    return index;
  } */



