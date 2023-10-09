


import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeValue extends StateNotifier<int> {
  ChangeValue() : super(0);

  int change({int value=0}) => state = value;
  //int  get index =>change();
}

final showHello = StateNotifierProvider<ChangeValue, int>((ref) => ChangeValue());
final textFieldProvider = StateProvider<String>((ref) => "");
final queryIdProvider = StateProvider<int>((ref) => 0);
