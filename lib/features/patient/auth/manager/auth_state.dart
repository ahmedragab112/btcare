part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoginLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {}

class AuthLoginError extends AuthState {
  final String error;
  const AuthLoginError({required this.error});
}


class AuthSignUpLoading extends AuthState {}

class AuthSignUpSuccess extends AuthState {}

class AuthSignUpError extends AuthState {
  final String error;
  const AuthSignUpError({required this.error});
}
