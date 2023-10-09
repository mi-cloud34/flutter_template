
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/model/base_view_model.dart';
import 'package:flutter_architecture/core/constants/navigation/navigation_constants.dart';
import 'package:flutter_architecture/core/extensions/context_extension.dart';
import 'package:flutter_architecture/core/extensions/string_extension.dart';
import 'package:flutter_architecture/core/init/network/vexana_manager.dart';
import 'package:flutter_architecture/view/_product/_constants/login_constants.dart';
import 'package:flutter_architecture/view/authenticate/login/model/user.dart';
import 'package:flutter_architecture/view/authenticate/login/service/ILoginService.dart';
import 'package:flutter_architecture/view/authenticate/login/service/login_service.dart';
import 'package:flutter_architecture/view/home/home/view/home_page.dart';
import 'package:flutter_architecture/view/riverpod/login_riverpod.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/image/image_constants.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
  @override
  ConsumerState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState
    with TickerProviderStateMixin, BaseViewModel {
  Future<User?>? _value;
  late final TabController _tabController;
  ILoginService? _loginServices;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GlobalKey<FormState> formState2 = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isLockOpen = true;
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController kodController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loginServices =
        LoginService(VexanaManager.instance.networkManager, scaffoldState);
    //fetchUser();
  }

  Future<User?>? fetchUser() {
    //Future<User?>? deger;
    User? user = User(
        mail: emailController.text,
        password: passwordController.text,
        token: "",
        id: 0,
        ad: "",
        aktif: true);

    ///if (formState.currentState?.validate() != null)  {
    _value = _loginServices!.login(ref,model: user);
    // debugPrint( "valueeeeeeeee:`${value?.then((value) => value?.ad.toString())}`");

    return _value;
  }

  /* @override
  didChangeDependencies() {
    super.didChangeDependencies();
    _loginServices?.login(ref: ref);
  }
 */
  @override
  Widget build(BuildContext context) {
    //var value = ref.watch(loginNotifier.notifier);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldState,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(child: buildAnimatedContainer(context)),
              Flexible(child: buildContainerTabBar(context)),
              Flexible(
                child: Padding(
                    padding: context.paddingNormal,
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: [
                          buildFormLogin(_value, context),
                          buildFormRegister(_value, context)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: context.lowDuration,
      height:
          context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      color: context.colors.onSecondary,
      child: Center(child: Image.asset(ImageConstants.instance.pt)),
    );
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Padding(
        padding: EdgeInsets.only(
            left: context.width * 0.1,
            right: context.width * 0.1,
            bottom: context.width * 0.05),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      labelStyle: context.textTheme.headlineSmall,
      unselectedLabelStyle: context.textTheme.bodyLarge,
      labelColor: Colors.black,
      indicatorColor: Colors.yellow,
      indicatorWeight: 5,
      controller: _tabController,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: const [
        Tab(text: LoginConstants.tab1),
        Tab(text: LoginConstants.tab2),
      ],
    );
  }

  Form buildFormLogin(value, BuildContext context) {
    return Form(
      key: formState,
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        children: [
          //const Spacer(flex: 6),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          const Spacer(),
          buildTextForgot(),
          //const Spacer(flex: 6),
          buildRaisedButtonLogin(context, value),
          buildWrapForgot(),
          const Spacer(),
        ],
      ),
    );
  }

  Form buildFormRegister(value, BuildContext context) {
    return Form(
      key: formState2,
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        children: [
          //const Spacer(flex: 6),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          buildTextFormFieldfirstName(context, value),
          buildTextFormFieldlastName(context, value),
          //const Spacer(),
          buildTextForgot(),
          //const Spacer(flex: 6),
          buildRaisedButtonRegister(context, value),
          buildWrapForgot(),
          //const Spacer(),
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(BuildContext context, value) {
    // var value= ref.watch(loginNotifier.notifier);
    return TextFormField(
      controller: passwordController,
      validator: (value) => value!.isNotEmpty ? null : 'This field required',
      //obscureText: isLockOpen,
      decoration: InputDecoration(
        labelStyle: context.textTheme.bodyLarge,
        labelText: LoginConstants.password,
        icon: buildContainerIconField(context, Icons.vpn_key),
        /*  suffixIcon: IconButton(
          onPressed: () {
            value.isLockStateChange();
          },
          padding: EdgeInsets.zero,
          icon: Icon(isLockOpen ? Icons.lock : Icons.lock_open),
        ), */
      ),
    );
  }

  TextFormField buildTextFormFieldfirstName(BuildContext context, value) {
    return TextFormField(
      controller: firstnameController,
      validator: (value) => value?.isNotEmpty != null ? 'asdasd' : null,
      decoration: InputDecoration(
        labelText: LoginConstants.firstName,
        labelStyle: context.textTheme.bodySmall,
        icon: buildContainerIconField(context, Icons.person),
      ),
    );
  }

  TextFormField buildTextFormFieldlastName(BuildContext context, value) {
    return TextFormField(
      controller: kodController,
      validator: (value) => value?.isNotEmpty != null ? 'asdasd' : null,
      decoration: InputDecoration(
        labelText: LoginConstants.lastName,
        labelStyle: context.textTheme.bodySmall,
        icon: buildContainerIconField(context, Icons.person),
      ),
    );
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, viewModel) {
    return TextFormField(
      controller: emailController,
      validator: (value) => value?.isValidEmail != null ? 'asdasd' : null,
      decoration: InputDecoration(
        labelText: LoginConstants.email,
        labelStyle: context.textTheme.bodySmall,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      color: context.colors.onError,
      padding: context.paddingLow,
      child: Icon(icon, color: context.colors.primaryContainer),
    );
  }

  Widget buildTextForgot() => const Align(
        alignment: Alignment.centerRight,
        child: Text(LoginConstants.forgotText, textAlign: TextAlign.end),
      );

  Widget buildRaisedButtonLogin(BuildContext context, value) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: context.paddingNormal,
        shape: const StadiumBorder(),
        backgroundColor: Colors.orange,
      ),
      onPressed: isLoading
          ? null
          : () async {
              if (formState.currentState?.validate() != null) {
                fetchUser();
                // ignore: unrelated_type_equality_checks
                if (fetchUser() == true) {
                  navigation.navigateToPageClear(
                      path: NavigationConstants.HOME_VIEW);
                }
              }
              navigation.navigateToPageClear(
                  path: NavigationConstants.HOME_VIEW);
            },
      child: Center(
        child: Text(
          LoginConstants.login,
          style: context.textTheme.bodyLarge
              ?.copyWith(color: context.colors.onPrimary),
        ),
      ),
    );
  }

  Widget buildRaisedButtonRegister(BuildContext context, value) {
    return Observer(
      builder: (_) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: context.paddingNormal,
            shape: const StadiumBorder(),
            backgroundColor: Colors.orange,
          ),
          onPressed: isLoading
              ? null
              : () {
                  var val = value.fetchRegisterService();

                  // ignore: unnecessary_null_comparison
                  if (val != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                },
          child: Center(
            child: Text(
              LoginConstants.register,
              style: context.textTheme.headlineSmall,
            ),
          ),
        );
      },
    );
  }

  Wrap buildWrapForgot() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text(LoginConstants.forgotText),
        TextButton(
          onPressed: () {},
          child: const Text(LoginConstants.tab2),
        ),
      ],
    );
  }
}
