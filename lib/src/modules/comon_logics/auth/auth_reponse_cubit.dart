import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/models/auth_response.dart';
import 'package:s_fashion/src/modules/comon_logics/auth/auth_reponse_state.dart';

class AuthReponseCubit extends Cubit<AuthReponseState> {
  AuthReponseCubit() : super(const AuthReponseState());

  void setAuthReponse(AuthResponse? authResponse) => emit(
        AuthReponseState(authReponse: authResponse),
      );
}
