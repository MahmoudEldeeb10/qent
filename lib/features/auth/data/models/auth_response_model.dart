import 'user_model.dart';

class AuthResponseModel {
  final String message;
  final UserModel user;
  final String accessToken;
  final String refreshToken;

  AuthResponseModel({
    required this.message,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json['message'],
        user: UserModel.fromJson(json['user']),
        accessToken: json['tokens']['access'],
        refreshToken: json['tokens']['refresh'],
      );
}