import 'package:cabinet_assistant/authentication/model/user_data.dart';

class AuthResponseModel {
  final String message;
  final bool success;
  final UserModel? user;
  final String? accessToken;

  const AuthResponseModel({
    required this.message,
    required this.success,
    required this.accessToken,
    required this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      message: json['message'],
      success: json['success'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      accessToken: json['access_token'],
    );
  }
}
