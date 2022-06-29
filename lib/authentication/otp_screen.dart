import 'package:cabinet_assistant/authentication/widget/signup_signin_suggestion.dart';
import 'package:cabinet_assistant/authentication/widget/padding_wrapper.dart';
import 'package:cabinet_assistant/routing/routing.dart';
import 'package:cabinet_assistant/utils/app_color.dart';
import 'package:cabinet_assistant/utils/common_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final ScreenRedirection screenRedirection;
  const OtpScreen({Key? key, required this.phoneNumber, required this.screenRedirection}) : super(key: key);
  /// Validate manually
  /// Don't call validate in build method, this is just illustration.
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final mobileNumberFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final defaultPinTheme = PinTheme(
    width: 72.w,
    height: 56.h,
    margin: EdgeInsets.only(right: 16.w),
    textStyle: TextStyle(
        fontSize: 16.sp, color: AppColor.black, fontWeight: FontWeight.w400),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.gray),
      borderRadius: BorderRadius.circular(4.r),
    ),
  );

  final _formKey = GlobalKey<FormState>();
  bool isValidOtp = false;

  void onOtpSubmitHandler() {
    if(widget.screenRedirection==ScreenRedirection.signInScreen) {
      Navigator.of(context).pushNamed(Routing.signUpScreen);
      return;
    }
    if(widget.screenRedirection==ScreenRedirection.confirmPasswordScreen){
      Navigator.of(context).pushNamed(Routing.newPasswordScreen);
    }
  }

  String get buttonName{
    if(widget.screenRedirection==ScreenRedirection.signInScreen) {
      return 'Next';
    }
    if(widget.screenRedirection==ScreenRedirection.confirmPasswordScreen){
      return 'Reset Password';
    }
    return 'Next';
  }

  void redirectSignInHandler() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: PaddingWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter OTP.',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'We’ve sent you the OTP to +1 ${mobileNumberFormatter.maskText(widget.phoneNumber)}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  // Otp Flow.
                  Form(
                    key: _formKey,
                    child: Pinput(
                      defaultPinTheme: defaultPinTheme,
                      validator: (s) {
                        return s == '2222' ? null : 'Pin is incorrect';
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isValidOtp = true;
                          });
                        } else {
                          setState(() {
                            if (isValidOtp) {
                              isValidOtp = false;
                            }
                          });
                        }
                      },
                    ),
                  )
                ],
              ),
             SignupSigninSuggestion(buttonText: buttonName,submitHandler: isValidOtp ? onOtpSubmitHandler : null,formAction: FormAction.signin,),
            ],
          ),
        ),
      ),
    );
  }
}
