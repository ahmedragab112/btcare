abstract class DoctorAuthState {}

class AuthInit extends DoctorAuthState {}

class LicenceUpdated extends DoctorAuthState {}

class AuthLoginSuccess extends DoctorAuthState {}

class AuthLoginError extends DoctorAuthState {
  final String error;
  AuthLoginError({required this.error});
}

class AuthLoginLoading extends DoctorAuthState {
  AuthLoginLoading();
}
class AuthSignUpSuccess extends DoctorAuthState {}

class AuthSignupError extends DoctorAuthState {
  final String error;
  AuthSignupError({required this.error});
}

class AuthSignupLoading extends DoctorAuthState {
  AuthSignupLoading();
}
