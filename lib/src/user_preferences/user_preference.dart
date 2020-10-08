import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();

  static final UserPreferences _instancia = UserPreferences._internal();

  SharedPreferences _prefs;

  void initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET de la última página
  bool get theme {
    return _prefs.getBool('isDarktheme') ?? false;
  }

  set theme( bool value ) {
    _prefs.setBool('isDarktheme', value);
  }

}
