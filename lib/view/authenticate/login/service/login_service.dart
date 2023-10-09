import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/view/authenticate/login/service/ILoginService.dart';
import 'package:flutter_architecture/view/riverpod/riverpod_genel.dart';
import 'package:flutter_architecture/view/riverpod/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vexana/vexana.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../_product/_enum/network_route_enum.dart';
import '../model/user.dart';

class LoginService extends ILoginService with BaseViewModel {
  LoginService(
    INetworkManager manager,
    GlobalKey<ScaffoldState> key,
  ) : super(manager, key);

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  Future<User?> login(WidgetRef ref, {User? model}) async {
    var id = ref.watch(queryIdProvider);
    final response = await manager.send<UserResponseModel, UserResponseModel>(
        NetworkRoutes.LOGIN.rawValue,
        isErrorDialog: true,
        parseModel: UserResponseModel(),
        method: RequestType.POST,
        data: model);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      if (response.data!.data is User) {
        //var datam = jsonEncode(response.data!.data);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // ref.read(userrProvider.notifier);
        debugPrint("adddd:`${response.data!.data!.ad}`");
        debugPrint("mail:`${response.data!.data!.mail}`");
        debugPrint("token:`${response.data!.data!.token}`");
        prefs.setString("token", response.data!.data!.token.toString());
        prefs.setInt("id", response.data!.data!.id as int);
        return response.data!.data;
      } else {
        if (scaffoldState.currentContext != null) {
          ScaffoldMessenger.of(scaffoldState.currentContext!).showSnackBar(
            SnackBar(
              content: Text(response.error!.description.toString()),
            ),
          );
        }
      }
    }

    return null;
  }

  @override
  Future<UserResponseModel> register(User model) async {
    final response = await manager.send<UserResponseModel, UserResponseModel>(
        NetworkRoutes.REGISTER.rawValue,
        parseModel: UserResponseModel(),
        method: RequestType.POST,
        data: model);

    // ignore: unnecessary_null_comparison
    if (response != null) {
      debugPrint(response.data!.data!.mail);
      return response.data as UserResponseModel;
    } else {}
    return Null as UserResponseModel;
  }
}
