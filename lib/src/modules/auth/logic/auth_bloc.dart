import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:s_fashion/src/modules/auth/logic/auth_event.dart';
import 'package:s_fashion/src/modules/auth/logic/auth_state.dart';
import 'package:s_fashion/src/repositories/auth_query/auth_query.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const InitState()) {
    on<LoginEvent>((event, emit) async {
      emit(const LoadingState());
      final reponse = await AuthQuery.loginAuth(
          event.auth['email']!, event.auth['password']!);

      if (reponse.error != null) {
        emit(ErrorState(reponse.error!));
      } else {
        Map<String, dynamic> jwtDecodedToken =
            JwtDecoder.decode(reponse.auth!.refreshToken);
        print(jwtDecodedToken);
        emit(LoadedState(response: reponse));
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(const LoadingState());

      final reponse = await AuthQuery.registerAuth(
        event.auth['username']!,
        event.auth['email']!,
        event.auth['password']!,
      );

      if (reponse.error != null) {
        emit(ErrorState(reponse.error!));
      } else {
        emit(LoadedState(response: reponse));
      }
    });
  }
}
