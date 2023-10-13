import 'package:s_fashion/src/models/auth.dart';

class AuthResponse {
  final Auth? auth;
  final String? error;

  AuthResponse({this.auth}) : error = null;

  AuthResponse.fromJSON(Map<String, dynamic> user)
      : error = null,
        auth = Auth.fromJson(user);

  AuthResponse.error(String errorMes)
      : error = errorMes,
        auth = null;
}
