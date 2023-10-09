import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/app/enums/locale_preferences_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../_product/_constants/image_path_svg.dart';
import '../model/on_board_model.dart';
part 'on_board_view_model.g.dart';

// ignore: library_private_types_in_public_api
class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    context = context;
  }

  List<OnBoardModel> onBoardItems = [];

  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  void init() {
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
}
