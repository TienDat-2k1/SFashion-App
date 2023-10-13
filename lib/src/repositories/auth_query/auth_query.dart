import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:s_fashion/src/constants/base_url.dart';
import 'package:s_fashion/src/models/auth_response.dart';

final dio = Dio();
final logger = Logger();

class AuthQuery {
  static Future<AuthResponse> loginAuth(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };

    try {
      final response = await dio.post(BaseUrl.authLogin, data: data);

      if (response.statusCode == 200) {
        //logger.i(response.data);
        if (response.data != null) {
          final user = response.data['data']['user'];
          return AuthResponse.fromJSON(user);
        }
      }
    } on DioException catch (e) {
      //logger.e(e.response.toString());
      if (e.response != null) {
        return AuthResponse.error(e.response!.data['message']);
      }
    }

    return AuthResponse.error('Have failured in fetch api');
  }

  static Future<AuthResponse> registerAuth(
    String username,
    String email,
    String password,
  ) async {
    final data = {
      'name': username,
      'email': email,
      'password': password,
      'passwordConfirm': password,
    };

    try {
      final response = await dio.post(BaseUrl.authSignUp, data: data);

      if (response.statusCode == 201) {
        //logger.i(response.data);
        if (response.data != null) {
          final user = response.data['data']['user'];
          return AuthResponse.fromJSON(user);
        }
      }
    } on DioException catch (e) {
      //logger.e(e.response.toString());
      if (e.response != null) {
        return AuthResponse.error(e.response!.data['message']);
      }
    }

    return AuthResponse.error('Have failured in fetch api');
  }
}
