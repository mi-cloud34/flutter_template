import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/model/base_view_model.dart';
import 'package:flutter_architecture/view/home/home/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app/enums/locale_preferences_enum.dart';
import '../../../authenticate/login/view/login_view.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with BaseViewModel {
  String? token1;
  SharedPreferences? pref;

  Future<SharedPreferences?> getValue() async {
    pref = await SharedPreferences.getInstance();
    // token1 = localeManager.getStringValue(PreferencesKeys.TOKEN);
    return pref;
  }

  @override
  void init() {
    // TODO: implement init
    super.initState();
    getValue();
    //token1=getValue() as String?;
     token1 = localeManager.getStringValue(PreferencesKeys.TOKEN);
  }

  @override
  Widget build(BuildContext context) {
    token1 = localeManager.getStringValue(PreferencesKeys.TOKEN);
    //debugPrint("tokenfirsttttttt:`$token1`");
    return token1!.isNotEmpty ? const HomePage() : const LoginView();
  }
}
