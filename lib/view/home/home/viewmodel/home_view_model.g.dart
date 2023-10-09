// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  Computed<int?>? _$indexxxComputed;

  @override
  int? get indexxx => (_$indexxxComputed ??= Computed<int?>(() => super.indexxx,
          name: '_HomeViewModelBase.indexxx'))
      .value;

  late final _$indexAtom =
      Atom(name: '_HomeViewModelBase.index', context: context);

  @override
  int? get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int? value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$valuesAtom =
      Atom(name: '_HomeViewModelBase.values', context: context);

  @override
  List<String> get values {
    _$valuesAtom.reportRead();
    return super.values;
  }

  @override
  set values(List<String> value) {
    _$valuesAtom.reportWrite(value, super.values, () {
      super.values = value;
    });
  }

  late final _$dropdownValueAtom =
      Atom(name: '_HomeViewModelBase.dropdownValue', context: context);

  @override
  String? get dropdownValue {
    _$dropdownValueAtom.reportRead();
    return super.dropdownValue;
  }

  @override
  set dropdownValue(String? value) {
    _$dropdownValueAtom.reportWrite(value, super.dropdownValue, () {
      super.dropdownValue = value;
    });
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  int? setValue({int? value}) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setValue');
    try {
      return super.setValue(value: value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
isLoading: ${isLoading},
values: ${values},
dropdownValue: ${dropdownValue},
indexxx: ${indexxx}
    ''';
  }
}
