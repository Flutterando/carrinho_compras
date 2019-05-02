import 'package:app/src/shared/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  SharedPreferences prefs;
  AuthService({this.prefs}) {
    if (prefs == null) {
      SharedPreferences.getInstance().then((item) {
        prefs = item;
      });
    }
  }

  Future<bool> isLogged() async {
    return prefs.getString("token") != null;
  }

  Future<bool> addToken(String token) {
    prefs.setString("token", token);
  }
}
