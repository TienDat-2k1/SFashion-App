import 'package:s_fashion/src/models/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceQuery {
  void setAuthReponse(Auth response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}
