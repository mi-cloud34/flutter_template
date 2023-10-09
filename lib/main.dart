
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/navigation/navigation_route.dart';
import 'package:flutter_architecture/core/navigation/navigation_service.dart';
import 'package:flutter_architecture/view/authenticate/onboard/view/on_board_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  runApp(
    ProviderScope(child: MyApp()),
    //)
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* final container = ProviderContainer();

    var token = container.read(userProvider.notifier).user.token;
    inspect(token);
    debugPrint("tokenmainnnnnnnn : `$token`"); */
    /* var token1 = Loca.getStringValue(PreferencesKeys.TOKEN);
    debugPrint("tokenanasayfa:`${token1}`"); */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      //theme: ThemeData.dark(),
      // ThemeData( colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // useMaterial3: true,

      home: OnBoardView(),

      //  onGenerateRoute: NavigationRoute.instance.generateRoute,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
