import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/navigation/navigation_service.dart';
import '../../init/cache/locale_storage_manager.dart';
import '../../init/network/vexana_manager.dart';

mixin BaseViewModel {
 
  void setContext(BuildContext contextt){}
  void init(){}
   VexanaManager? vexanaManager = VexanaManager.instance;

  //ICoreDio? coreDio=NetworkManager.instance!.coreDio;
 LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  
}