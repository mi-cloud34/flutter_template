/* 
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/model/base_view_model.dart';
import 'package:flutter_architecture/core/constants/app/enums/locale_preferences_enum.dart';
import 'package:flutter_architecture/view/authenticate/login/model/user.dart';
import 'package:flutter_architecture/view/authenticate/login/service/ILoginService.dart';
import 'package:flutter_architecture/view/authenticate/login/service/login_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/init/network/vexana_manager.dart';

final loginNotifier = StateNotifierProvider<LoginNotifier, User>((Ref ref) {
  /*  String user;
      var user_provider=ref.read(userProvider.notifier).setUser(user); */
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<User> with BaseViewModel {
  late ILoginService _loginServices;
  bool isLoading = false;
  bool isLockOpen = true;
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController kodController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GlobalKey<FormState> formState2 = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  String? token;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginNotifier(Ref<Object?> ref) : super(User()) {
    _loginServices =
        LoginService(VexanaManager.instance.networkManager, scaffoldState);
    fetchLoginService();
  }

  Future<User?> fetchLoginService() async {
    User? user = User(
        mail: emailController.text,
        password: passwordController.text,
        token: "",
        id: 0,
        ad: "",
        aktif: true);
    isLoadingChange();
    if (formState.currentState?.validate() != null) {
      final response = await _loginServices.login(ref,model: user);
//
      // ignore: unnecessary_null_comparison
      if (response != null) {
  
        // ignore: unnecessary_type_check
        if (response is User) {
          user = response;

          // final container = ProviderContainer();
          // container.read(userProvider.notifier).setUser(datam);
          return user;
        }
        if (scaffoldState.currentContext != null) {
          ScaffoldMessenger.of(scaffoldState.currentContext!).showSnackBar(
            const SnackBar(
              content: Text("hata cıktı"),
            ),
          );
        }
        await localeManager.setStringValue(
          PreferencesKeys.TOKEN,
          response.token!.toString(),
        );
        token = localeManager.getStringValue(
          PreferencesKeys.TOKEN,
        );
        debugPrint("tokenssss: `${response.token}`");
      }
    }
    isLoadingChange();
    return null;
  }

  Future<User?> fetchRegisterService() async {
    isLoadingChange();
    if (formState2.currentState?.validate() != null) {
      final response = await _loginServices.register(
        User(
          mail: emailController.text,
          password: passwordController.text,
          ad: firstnameController.text,
          // kod: kodController.text
        ),
      );

      // ignore: unnecessary_null_comparison
      if (response != null) {
        // if (response) return;
        if (scaffoldState.currentContext != null) {
          ScaffoldMessenger.of(scaffoldState.currentContext!).showSnackBar(
            const SnackBar(
              //content: Text(response.toString()),
              content: Text("Kayıt Başarılı"),
            ),
          );
        }

        return response.data;
      }
    }
    isLoadingChange();
    return null;
  }

  void isLoadingChange() {
    isLoading = !isLoading;
  }
}
 */