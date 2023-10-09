import 'package:flutter_architecture/core/init/network/ICoreDio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDio? coreDio;
  NetworkManager._init() {
    /*  final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      headers: {'val': LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}, */

    //  coreDio = CoreDio(baseOptions) as ICoreDio?;
    //as ICoreDio?;
  }
}
