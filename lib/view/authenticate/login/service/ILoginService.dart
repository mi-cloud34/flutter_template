
import 'package:flutter/material.dart';
import 'package:flutter_architecture/view/authenticate/login/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {

  ILoginService(this.manager, this.scaffoldyKey);
   
   final INetworkManager manager;
   final GlobalKey<ScaffoldState> scaffoldyKey;
  Future<User?> login(WidgetRef ref,{User model} );
  Future<UserResponseModel> register(User model);
}