import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/auth/data/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  // Login
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final response = await _authService.login(
        email: email,
        password: password,
      );
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Register
  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required int country,
    required int location,
  }) async {
    emit(AuthLoading());
    try {
      final response = await _authService.register(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
        country: country,
        location: location,
      );
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> requestVerifyCode({required String phone}) async {
    emit(AuthLoading());
    try {
      final result = await _authService.requestVerifyCode(phone: phone);
      print('OTP CODE: ${result['code']}');
      emit(AuthSuccess(null, result['verify_token']));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> confirmVerifyCode({
    required String code,
    required String verifyToken, // ✅ استقبله كـ parameter
  }) async {
    emit(AuthLoading());
    try {
      await _authService.confirmVerifyCode(
        code: code,
        verifyToken: verifyToken,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> resendVerifyCode({required String phone}) async {
    emit(AuthLoading());
    try {
      final result = await _authService.requestVerifyCode(phone: phone);
      print('OTP CODE RESENT: ${result['code']}');
      emit(AuthCodeResent()); // مش AuthSuccess
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void resetState() => emit(AuthInitial());
}





// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qent/features/auth/data/services/auth_service.dart';
// import 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   final AuthService _authService;

//   AuthCubit(this._authService) : super(AuthInitial());

//   //  Login
//   Future<void> login({required String email, required String password}) async {
//     emit(AuthLoading());
//     try {
//       final response = await _authService.login(
//         email: email,
//         password: password,
//       );
//       emit(AuthSuccess(response));
//     } catch (e) {
//       emit(AuthFailure(e.toString()));
//     }
//   }

//   //  Register
//   Future<void> register({
//     required String fullName,
//     required String email,
//     required String phone,
//     required String password,
//     required int country,
//     required int location,
//   }) async {
//     emit(AuthLoading());
//     try {
//       final response = await _authService.register(
//         fullName: fullName,
//         email: email,
//         phone: phone,
//         password: password,
//         country: country,
//         location: location,
//       );
//       emit(AuthSuccess(response));
//     } catch (e) {
//       emit(AuthFailure(e.toString()));
//     }
//   }

//   void resetState() => emit(AuthInitial());

//   // 

// Future<void> requestVerifyCode({required String phone}) async {
//   emit(AuthLoading());
//   try {
//     await _authService.requestVerifyCode(phone: phone);
//     emit(AuthSuccess());
//   } catch (e) {
//     emit(AuthFailure(e.toString()));
//   }
// }

// Future<void> confirmVerifyCode({
//   required String phone,
//   required String code,
// }) async {
//   emit(AuthLoading());
//   try {
//     await _authService.confirmVerifyCode(phone: phone, code: code);
//     emit(AuthSuccess());
//   } catch (e) {
//     emit(AuthFailure( e.toString()));
//   }
// }
// }
