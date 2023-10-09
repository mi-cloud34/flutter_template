import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/model/base_view_model.dart';
import 'package:flutter_architecture/core/constants/app/enums/locale_preferences_enum.dart';
import 'package:flutter_architecture/core/extensions/context_extension.dart';
import 'package:flutter_architecture/core/init/cache/locale_storage_manager.dart';
import 'package:flutter_architecture/view/_product/_widgets/textinput/text_input.dart';
import 'package:flutter_architecture/view/home/home/view/drawer.dart';
import 'package:flutter_architecture/view/home/home/view/view_page.dart';
import 'package:flutter_architecture/view/riverpod/riverpod_genel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../admin/view/admin_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState with BaseViewModel {
  //caricart_view.cariCartList?.forEach((element) { element.Arac_Ad;});
  int _currentPage = 0;
  PageController? _pageController;
  @override
  void initState() {
    
    super.initState();
    _pageController = PageController();
   // ref.read(queryIdProvider.notifier).state=0;
  }

  @override
  Widget build(BuildContext context) {
    int indexx = ref.watch(showHello);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(90.0),
              child: Column(
                children: [
                  indexx == 0
                      ? const HomeInput(
                          //text: caricart_view.cariCartList![0].AdresPostaKod)
                          )
                      : const SizedBox()
                ],
              )),
          backgroundColor: Colors.black,
          title: Text(
            " App",
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.colors.onPrimary,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.sunny,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
              onPressed: () {
                navigation.navigateToPageClear(
                    path: NavigationConstants.LOGIN_VIEW);
                localeManager.deletedPref(PreferencesKeys.TOKEN);
                var token = LocaleManager.instance
                    .getStringValue(PreferencesKeys.TOKEN);
                inspect(indexx);
                inspect(token);
              },
              icon: const Icon(
                Icons.login_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        body: PageView(
          //physics: NeverScrollableScrollPhysics(),
          onPageChanged: (openPage) {
            setState(() {
              _currentPage = openPage;
            });
          },
          controller: _pageController,
          children: <Widget>[ViewPage(), AdminPage()],
        ),
        drawer: const DrawerPage(),
        bottomNavigationBar: /* Container(
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50))), */
            ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          child: BottomNavigationBar(
              backgroundColor: Colors.blue,
              elevation: 5,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              mouseCursor: MouseCursor.uncontrolled,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'admin'),
              ],
              currentIndex: _currentPage,
              //  selectedItemColor: Colors.amber[800],
              onTap: (selectPage) {
                setState(() {
                  _pageController?.jumpToPage(selectPage);
                 
                });
              }),
        ),
      ),
    );
  }
}
