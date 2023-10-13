import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/auth_response.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class LoadingState extends AuthState {
  const LoadingState() : super();

  @override
  List<Object?> get props => [];
}

class LoadedState extends AuthState {
  final AuthResponse response;

  const LoadedState({required this.response}) : super();

  @override
  List<Object?> get props => [];
}

class ErrorState extends AuthState {
  final String mesError;

  const ErrorState(this.mesError) : super();

  @override
  List<Object?> get props => [];
}

class InitState extends AuthState {
  const InitState() : super();

  @override
  List<Object?> get props => [];
}
