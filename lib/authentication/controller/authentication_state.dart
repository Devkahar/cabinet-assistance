part of 'authentication_controller.dart';

enum AuthenticationStatus {
  initial,
  getOtp,
  getOtpSuccess,
  getOtpError,
  getOtpVerificationLoading,
  getOtpVerificationSuccess,
  getOtpVerificationInvalid,
  getOtpVerificationError,
  registerUserLoading,
  registerUserSuccess,
  registerUserError,
  registerUserInvalid,
  loginUserLoading,
  loginUserSuccess,
  loginUserError,
  loginUserInvalid,
  forgotPasswordLoading,
  forgotPasswordSuccess,
  forgotPasswordError,
  forgotPasswordInvalid,
  resetPasswordLoading,
  resetPasswordSuccess,
  resetPasswordError,
  resetPasswordInvalid,

}

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.phoneNumber = '',
    this.message = '',
    this.success = false,
    this.status = AuthenticationStatus.initial,
  });

  final String phoneNumber;
  final String message;
  final bool success;
  final AuthenticationStatus status;

  AuthenticationState copyWith({
    String? phoneNumber,
    String? message,
    bool? success,
    AuthenticationStatus? status,
  }) {
    return AuthenticationState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      message: message ?? this.phoneNumber,
      success: success ?? this.success,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumber, message, success, status];
}
