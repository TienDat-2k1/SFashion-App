import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/auth_response.dart';

class AuthReponseState extends Equatable {
  final AuthResponse? authReponse;

  const AuthReponseState({this.authReponse});

  @override
  List<Object?> get props => [authReponse];
}
