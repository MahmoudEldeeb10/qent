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

// import 'package:equatable/equatable.dart';
// import 'package:qent/features/auth/data/models/auth_response_model.dart';

// abstract class AuthState extends Equatable {
//   const AuthState();

//   @override
//   List<Object?> get props => [];
// }

// class AuthInitial extends AuthState {}

// class AuthLoading extends AuthState {}

// class AuthSuccess extends AuthState {
//   final AuthResponseModel authResponse;

//   const AuthSuccess(this.authResponse);

//   @override
//   List<Object?> get props => [authResponse];
// }

// class AuthFailure extends AuthState {
//   final String message;

//   const AuthFailure(this.message);

//   @override
//   List<Object?> get props => [message];
// }
