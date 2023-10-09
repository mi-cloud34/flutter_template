import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/components/cards/not_found_navigator.dart';
import 'package:flutter_architecture/core/constants/navigation/navigation_constants.dart';
import 'package:flutter_architecture/view/authenticate/login/view/login_view.dart';
import 'package:flutter_architecture/view/home/home/view/first_page.dart';
import 'package:flutter_architecture/view/home/home/view/home_page.dart';
import 'package:flutter_architecture/view/home/pomvardimas/view/pomvardimas_view.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      /*  case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT); */

      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView(), NavigationConstants.LOGIN_VIEW);
      case NavigationConstants.FIRST_PAGE:
        return normalNavigate(const FirstPage(), NavigationConstants.FIRST_PAGE);
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(const HomePage(), NavigationConstants.HOME_VIEW);
      case NavigationConstants.POMVARDIMAS:
        return normalNavigate(PomvardimasView(), NavigationConstants.POMVARDIMAS);

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigator(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName),
    );
  }
}
