import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/auth_response_model.dart';

class AuthService {
  final Dio _dio;
  final FlutterSecureStorage _storage;

  static const String _baseUrl = 'https://qent.azurewebsites.net/api';
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  AuthService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {'Content-Type': 'application/json'},
        ),
      ),
      _storage = const FlutterSecureStorage();

  //  Login
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login/',
        data: {'email': email, 'password': password},
      );
      final authResponse = AuthResponseModel.fromJson(response.data);
      await _saveTokens(authResponse.accessToken, authResponse.refreshToken);
      return authResponse;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  //  Register
  Future<AuthResponseModel> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    int country = 1,
    int location = 6,
    String? national_id,
    String? date_of_birth,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/register/',
        data: {
          'full_name': fullName,
          'email': email,
          'phone': phone,
          'password': password,
          'country_id': country,
          'location_id': location,
        },
      );

      final authResponse = AuthResponseModel.fromJson(response.data);
      await _saveTokens(authResponse.accessToken, authResponse.refreshToken);
      return authResponse;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  //  Token helpers
  Future<void> _saveTokens(String access, String refresh) async {
    await _storage.write(key: _accessTokenKey, value: access);
    await _storage.write(key: _refreshTokenKey, value: refresh);
  }

  Future<String?> getAccessToken() => _storage.read(key: _accessTokenKey);

  Future<String?> getRefreshToken() => _storage.read(key: _refreshTokenKey);

  Future<void> logout() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  //  Error handler
  String _handleError(DioException e) {
    if (e.response != null) {
      final data = e.response!.data;
      if (data is Map) {
        // Return first error message from API
        final firstValue = data.values.first;
        if (firstValue is List) return firstValue.first.toString();
        return firstValue.toString();
      }
    }
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Please try again.';
      case DioExceptionType.connectionError:
        return 'No internet connection.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }


  Future<Map<String, String>> requestVerifyCode({required String phone}) async {
  try {
    final token = await getAccessToken();
    final response = await _dio.post(
      '/auth/phone/request_verify_code/',
      data: {'phone': phone},
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    // ✅ رجّع الـ code و verify_token
    return {
      'code': response.data['code'].toString(),
      'verify_token': response.data['verify_token'].toString(),
    };
  } on DioException catch (e) {
    throw _handleError(e);
  }
}

  

 Future<void> confirmVerifyCode({
  required String code,
  required String verifyToken,
}) async {
  try {
    final token = await getAccessToken();
    final response = await _dio.post(
      '/auth/phone/confirm_verify_code/',
      data: {
        'code': code,
        'verify_token': verifyToken, // ✅
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    if (response.statusCode != 200) {
      throw Exception(response.data['message'] ?? 'Invalid code');
    }
  } on DioException catch (e) {
    throw _handleError(e);
  }
}
}
