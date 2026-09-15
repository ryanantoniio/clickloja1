import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String _keyUser = 'USER';

  //salva o status de login do usuário (true = logado, false = deslogado)
  Future<void> setUserStatus(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyUser, value);
  }

  //retorna o status de login true ou false
  Future<bool> getUserStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyUser) ?? false;
  }
}
