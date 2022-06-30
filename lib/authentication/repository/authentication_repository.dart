import 'dart:convert';

import 'package:cabinet_assistant/authentication/model/auth_res_data.dart';
import 'package:cabinet_assistant/authentication/model/user_data.dart';
import 'package:cabinet_assistant/authentication/repository/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationRepositoryProvider =
    Provider((ref) => AuthenticationRepository());

class AuthenticationRepository {
  Future<AuthResponseModel> registrationOtp(Map<String, String> payload) async {
    try {
      final res = await ApiClient().post('auth/registration-otp', payload);
      if (kDebugMode) {
        print(res);
      }
      final data = AuthResponseModel.fromJson(res);
      return data;
    } catch (error) {
      throw 'SomeThing Went Wrong';
    }
  }

  Future<AuthResponseModel> verifyForgotPasswprd(
      Map<String, String> payload) async {
    try {
      final res =
          await ApiClient().post('auth/verify-forgot-password', payload);
      if (kDebugMode) {
        print(res);
      }
      final data = AuthResponseModel.fromJson(res);
      return data;
    } catch (error) {
      throw 'SomeThing Went Wrong';
    }
  }

  Future<AuthResponseModel> verifyOtp(Map<String, String> payload) async {
    try {
      final res = await ApiClient().post('auth/verify-otp', payload);
      if (kDebugMode) {
        print(res);
      }
      final data = AuthResponseModel.fromJson(res);
      return data;
    } catch (error) {
      throw 'SomeThing Went Wrong';
    }
  }

  Future<AuthResponseModel> registerUser(Map<String, String> payload) async {
    try {
      final res = await ApiClient().post('auth/registration', payload);
      if (kDebugMode) {
        print(res);
      }
      final data = AuthResponseModel.fromJson(res);
      return data;
    } catch (error) {
      throw 'SomeThing Went Wrong';
    }
  }

  Future<AuthResponseModel> loginUser(Map<String, String> payload) async {
    try {
      final res = await ApiClient().post('auth/login', payload);
      print("Imm here");
      if (kDebugMode) {
        print(UserModel.fromJson(res['user']));
      }
      print("Imm here");
      final data = AuthResponseModel.fromJson(res);
      return data;
    } catch (error) {
      throw 'SomeThing Went Wrong';
    }
  }

  Future<AuthResponseModel> forgotPassword(Map<String, String> payload) async {
    try {
      final res = await ApiClient().post('auth/forgot-password', payload);
      if (kDebugMode) {
        print(res);
      }
      final data = AuthResponseModel.fromJson(res);
      return data;
    } catch (error) {
      throw 'SomeThing Went Wrong';
    }
  }

  Future<AuthResponseModel> resetPassword(Map<String, String> payload) async {
    try {
      final res = await ApiClient().post('auth/reset-password', payload);
      if (kDebugMode) {
        print(res);
      }
      final data = AuthResponseModel.fromJson(res);
      return data;
    } catch (error) {
      throw 'SomeThing Went Wrong';
    }
  }
}
