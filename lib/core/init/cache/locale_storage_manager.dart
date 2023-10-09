 import 'package:flutter_architecture/core/constants/app/enums/locale_preferences_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocaleManager {
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;
  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }
   String getStringValue(PreferencesKeys key) =>
      _preferences?.getString(key.toString()) ?? '';
  Future<void> clearAll() async {
    await _preferences!.clear();
  }
  void setValue(PreferencesKeys key, String value){
  _preferences!.setString(key.toString(), value);
}

  Future<void> clearAllSaveFirst() async {
    if (_preferences != null) {
      await _preferences!.clear();
      await setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    }
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

   setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

 

  bool getBoolValue(PreferencesKeys key) =>
      _preferences!.getBool(key.toString()) ?? false;
  Future<void> deletedPref(PreferencesKeys key) =>
      _preferences!.remove(key.toString());
}

