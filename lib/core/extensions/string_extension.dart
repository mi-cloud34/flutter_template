import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_architecture/core/constants/app/app_constants.dart';

extension StringLocalization on String {
  String get local => this.tr();

  String? get isValidEmail =>
    contains(RegExp(ApplicationConstants.EMAIL_REGIEX))
          ? null
          : "Email does not valid";
  bool get isValidEmails =>
      RegExp(ApplicationConstants.EMAIL_REGIEX).hasMatch(this);


  int get lg => length;
  String? get charakterSplit => substring(0, lg > 10 ? 10 : null);
}

extension ImagePathExtension on String {
  String get toSVG => 'asset/svg/$this.svg';
}
