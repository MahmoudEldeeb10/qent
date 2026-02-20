part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

// في auth_state.dart عدّل AuthSuccess
class AuthSuccess extends AuthState {
  final dynamic response;
  final String? verifyToken;
  const AuthSuccess([this.response, this.verifyToken]);
}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
}

class AuthCodeResent extends AuthState {}

class ForgotPasswordSuccess extends AuthState {
  final String code;
  final String resetToken; // ✅
  const ForgotPasswordSuccess(this.code, this.resetToken);
}
