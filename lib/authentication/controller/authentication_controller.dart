import 'package:cabinet_assistant/authentication/model/auth_res_data.dart';
import 'package:cabinet_assistant/authentication/repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

part 'authentication_state.dart';

final authenticationControllerProvider = StateNotifierProvider.autoDispose<
        AuthenticationController, AuthenticationState>(
    (ref) => AuthenticationController(
          repository: ref.read(authenticationRepositoryProvider),
        ));

class AuthenticationController extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository _repository;

  AuthenticationController({required AuthenticationRepository repository})
      : _repository = repository,
        super(const AuthenticationState());

  Future<bool> getOtp(String phoneNumber) async {
    if (kDebugMode) {
      print("Getting OTP");
    }
    state = state.copyWith(
      status: AuthenticationStatus.getOtp,
    );
    try {
      final payload = {'phone': phoneNumber};
      final AuthResponseModel res = await _repository.registrationOtp(payload);
      print('Here get Response ${res.message}');
      state = state.copyWith(
        status: AuthenticationStatus.getOtpSuccess,
        message: res.message,
        success: res.success,
        phoneNumber: phoneNumber,
      );
      if (res.success) return true;
      return false;
    } catch (error) {
      state = state.copyWith(
        status: AuthenticationStatus.getOtpError,
      );
      return false;
    }
  }

  Future<bool> otpVerifiction(String otp, bool reset) async {
    if (kDebugMode) {
      print("OTP verification Begin");
    }
    state = state.copyWith(
      status: AuthenticationStatus.getOtpVerificationLoading,
    );
    try {
      final payload = {'phone': state.phoneNumber, 'otp': otp};
      final AuthResponseModel res = await (reset
          ? _repository.verifyForgotPasswprd(payload)
          : _repository.verifyOtp(payload));

      if (kDebugMode) {
        print('Here get Response ${res.message}');
      }
      if (!res.success) {
        state = state.copyWith(
          status: AuthenticationStatus.getOtpVerificationInvalid,
          message: res.message,
          success: res.success,
        );
        return false;
      }
      state = state.copyWith(
        status: AuthenticationStatus.getOtpVerificationSuccess,
        message: res.message,
        success: res.success,
      );
      return true;
    } catch (error) {
      state = state.copyWith(
        status: AuthenticationStatus.getOtpVerificationError,
      );
      return false;
    }
  }

  Future<bool> registerUser(
      String name, String password, String role, String email) async {
    if (kDebugMode) {
      print("Registration Begin");
    }
    state = state.copyWith(
      status: AuthenticationStatus.registerUserLoading,
    );
    try {
      final AuthResponseModel res = await _repository.registerUser({
        'phone': state.phoneNumber,
        'name': name,
        'password': password,
        'role': role,
        'email': email
      });

      if (kDebugMode) {
        print('Here get Response ${res.message}');
      }
      if (!res.success) {
        state = state.copyWith(
          status: AuthenticationStatus.registerUserInvalid,
          message: res.message,
          success: res.success,
        );
        return false;
      }
      state = state.copyWith(
        status: AuthenticationStatus.registerUserSuccess,
        message: res.message,
        success: res.success,
      );
      return true;
    } catch (error) {
      state = state.copyWith(
        status: AuthenticationStatus.registerUserError,
      );
      return false;
    }
  }

  Future<bool> loginUser(String phoneNumber, String password) async {
    if (kDebugMode) {
      print("Login Begin");
    }
    state = state.copyWith(
      status: AuthenticationStatus.loginUserLoading,
    );
    print('$phoneNumber $password');
    try {
      final AuthResponseModel res = await _repository.loginUser({
        'phone': phoneNumber,
        'password': password,
      });
      if (kDebugMode) {
        print('Here get Response ${res.message}');
      }
      if (!res.success) {
        state = state.copyWith(
          status: AuthenticationStatus.loginUserInvalid,
          message: res.message,
          success: res.success,
        );
        return false;
      }
      state = state.copyWith(
        status: AuthenticationStatus.loginUserSuccess,
        message: res.message,
        success: res.success,
        phoneNumber: phoneNumber,
      );
      return true;
    } catch (error) {
      state = state.copyWith(
        status: AuthenticationStatus.loginUserError,
      );
      return false;
    }
  }

  Future<bool> forgotPassword(String phoneNumber) async {
    if (kDebugMode) {
      print("forgotPassword Begin");
    }
    state = state.copyWith(
      status: AuthenticationStatus.forgotPasswordLoading,
    );
    print(phoneNumber);
    try {
      final AuthResponseModel res = await _repository.forgotPassword({
        'phone': phoneNumber,
      });
      if (kDebugMode) {
        print('Here get Response ${res.message}');
      }
      if (!res.success) {
        state = state.copyWith(
          status: AuthenticationStatus.forgotPasswordInvalid,
          message: res.message,
          success: res.success,
        );
        return false;
      }
      state = state.copyWith(
        status: AuthenticationStatus.forgotPasswordSuccess,
        message: res.message,
        success: res.success,
        phoneNumber: phoneNumber,
      );
      return true;
    } catch (error) {
      state = state.copyWith(
        status: AuthenticationStatus.forgotPasswordError,
      );
      return false;
    }
  }
  Future<bool> resetPassword(String password) async {
    if (kDebugMode) {
      print("forgotPassword Begin");
    }
    state = state.copyWith(
      status: AuthenticationStatus.forgotPasswordLoading,
    );
    try {
      final AuthResponseModel res = await _repository.resetPassword({
        'phone': state.phoneNumber,
        'password': password,
      });
      if (kDebugMode) {
        print('Here get Response ${res.message}');
      }
      if (!res.success) {
        state = state.copyWith(
          status: AuthenticationStatus.resetPasswordInvalid,
          message: res.message,
          success: res.success,
        );
        return false;
      }
      state = state.copyWith(
        status: AuthenticationStatus.resetPasswordSuccess,
        message: res.message,
        success: res.success,
        phoneNumber: state.phoneNumber,
      );
      return true;
    } catch (error) {
      state = state.copyWith(
        status: AuthenticationStatus.resetPasswordError,
      );
      return false;
    }
  }
}
