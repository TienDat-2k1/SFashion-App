import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final Map<String, String?> auth;

  const LoginEvent({required this.auth});

  @override
  List<Object?> get props => [];
}

class RegisterEvent extends AuthEvent {
  final Map<String, String?> auth;

  const RegisterEvent({required this.auth});

  @override
  List<Object?> get props => [];
}
