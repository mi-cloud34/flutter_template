import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/model/base_view_model.dart';
import 'package:flutter_architecture/core/constants/app/enums/locale_preferences_enum.dart';
import 'package:flutter_architecture/core/constants/navigation/navigation_constants.dart';
import 'package:flutter_architecture/core/extensions/context_extension.dart';
import 'package:flutter_architecture/view/_product/_constants/image_path_svg.dart';
import 'package:flutter_architecture/view/riverpod/user_provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../_product/_widgets/avatar/on_board_circle.dart';
import '../model/on_board_model.dart';

class OnBoardView extends ConsumerStatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends ConsumerState with BaseViewModel {
  String? token1;

  //LocaleManager? manager;

  Future<SharedPreferences?> getValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token1 = pref.getString("token") ?? '';
    debugPrint("tokenonboardmain:`$token1`");
    return pref;
  }

  List<OnBoardModel> onBoardItems = [];
  bool isLoading = false;
  int currentIndex = 0;
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  @override
  void initState() {
    var token = localeManager.getStringValue(PreferencesKeys.TOKEN);
    debugPrint("tokeninitLoginonboard:`$token`");
    super.initState();
    //token1 = LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN);
    // initPref();
    getValue();
    //token1 = localeManager.getStringValue(PreferencesKeys.TOKEN);
    onBoardItems.addAll([
      OnBoardModel("BackOfis App", "Uygulamamıza Hoşgeldiniz",
          SVGImagePaths.instance.one),
      OnBoardModel(
        "Uygulama Hakkında",
        "Uygulamaıza kolaylıkla kaydolup işlemlerinizi gerçekleştirebilirsiniz",
        SVGImagePaths.instance.twoo,
      ),
      OnBoardModel(
        "Kayıt",
        "sağ alta kayıt ekranına gidebilirsiniz",
        SVGImagePaths.instance.three,
      ),
      //OnBoardModel(LocaleKeys.onBoard_page3_title, LocaleKeys.onBoard_page3_desc, SVGImagePaths.instance.one),
    ]);
  }

  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    } else {
      await navigation.navigateToPageClear(
          path: NavigationConstants.FIRST_PAGE);
    }
  }

  Future<void> homePage() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    } else {
      await navigation.navigateToPageClear(path: NavigationConstants.HOME_VIEW);
    }
  }

  @override
  Widget build(BuildContext context) {
    // token1 = localeManager.getStringValue(PreferencesKeys.TOKEN);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    var value = ref.watch(userrProvider);
    var name = value.ad;
    debugPrint("firstnameeeeee:`${name}`");
    debugPrint("tokenonboard:`${token1}`");
    return Scaffold(
      body: Padding(
        padding: context.paddingNormalHorizontal,
        child: Column(
          children: [
            const Spacer(),
            Expanded(flex: 5, child: buildPageView(onBoardItems)),
            Expanded(flex: 2, child: buildRowFooter(onBoardItems, context)),
          ],
        ),
      ),
    );
  }

  PageView buildPageView(List<OnBoardModel> boardItems) {
    return PageView.builder(
      itemCount: boardItems.length,
      onPageChanged: (value) {
        changeCurrentIndex(value);
      },
      itemBuilder: (context, index) =>
          buildColumnBody(context, boardItems[index]),
    );
  }

  Row buildRowFooter(List<OnBoardModel> boardItems, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildListViewCircles(boardItems),
        Expanded(
          child: Center(
            child: Visibility(
              visible: isLoading,
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
        buildFloatingActionButtonSkip(context)
      ],
    );
  }

  ListView buildListViewCircles(List<OnBoardModel> items) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) {
            return OnBoardCircle(
              isSelected: currentIndex == index,
            );
          },
        );
      },
    );
  }

  FloatingActionButton buildFloatingActionButtonSkip(
    BuildContext context,
  ) {
    var user = ref.watch(userrProvider.notifier).state;
    debugPrint("userrrriverpod:`${user.token}`");
    return FloatingActionButton(
        backgroundColor: context.colors.secondaryContainer,
        child: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () {
          //user.user.token == null ? completeToOnBoard() : homePage();
          var tokennnn = ref.watch(userrProvider.notifier).state.token;
          debugPrint("tokenOnBoard:`${tokennnn}`");
           navigation.navigateToPageClear(
                  path: NavigationConstants.LOGIN_VIEW);
          /*  tokennnn != null
              ? navigation.navigateToPageClear(
                  path: NavigationConstants.LOGIN_VIEW)
              : navigation.navigateToPageClear(path: NavigationConstants.HOME_VIEW); */
               //navigation.navigateToPageClear( path: NavigationConstants.HOME_VIEW); 
            
          var token = localeManager.getStringValue(PreferencesKeys.TOKEN);
          debugPrint("tokenLoginonboard:`${token}`");
        });
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildAutoLocaleTextDescription(model, context),
        )
      ],
    );
  }

  Text buildAutoLocaleTextTitle(
    OnBoardModel model,
    BuildContext context,
  ) {
    return Text(
      model.title,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
    );
  }

  Text buildAutoLocaleTextDescription(
    OnBoardModel model,
    BuildContext context,
  ) {
    return Text(
      model.description,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.w100, color: Colors.black87),
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
