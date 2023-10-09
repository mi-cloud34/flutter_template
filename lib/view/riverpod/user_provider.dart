import 'package:flutter/material.dart';
import 'package:flutter_architecture/view/authenticate/login/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*class UserNotifier extends ChangeNotifier {
  User _user = User(
    id: 0,
    ad: '',
    mail: '',
    password: '',
    token: '',
    aktif: false,
    firmano: 0,
    //kod:''
 
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJsonn(user);
    debugPrint("usermaninnnnnnnn :`${_user.mail}`");
    debugPrint("useradddddddd_user.ad}`");
    debugPrint("usermanidddddd:`${_user.id}`");
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
} 
 final userProvider = ChangeNotifierProvider<UserNotifier>((ref) {
  return UserNotifier();
});
 

*/
/* final userrProvider = StateNotifierProvider<UserNotifier, User>((ref)=>UserNotifier());
class UserNotifier extends StateNotifier<User>{

  UserNotifier() : super(User());
   User _user = User(
    id: 0,
    ad: '',
    mail: '',
    password: '',
    token: '',
    aktif: false,
    firmano: 0,);
     User get user => _user;

  void setUser(String user) {
    _user = User.fromJsonn(user);
    debugPrint("usermaninnnnnnnn :`${_user.mail}`");
    debugPrint("useradddddddd_user.ad}`");
    debugPrint("usermanidddddd:`${_user.id}`");
  
  }

  void setUserFromModel(User user) {
    _user = user;
   
  }
}  */
final userrProvider = StateNotifierProvider<AuthNotifier, User>((Ref ref) {
  return AuthNotifier(User());
});

class AuthNotifier extends StateNotifier<User> {
  AuthNotifier(User state) : super(state);

  setCurrentUser(User user) {
    state = user;
  }

  void clearUser() {
    state = Null as User;
  }
}
