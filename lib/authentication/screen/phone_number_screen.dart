import 'package:cabinet_assistant/authentication/controller/authentication_controller.dart';
import 'package:cabinet_assistant/authentication/widget/loading_screen_wrapper.dart';
import 'package:cabinet_assistant/authentication/widget/app_logo.dart';
import 'package:cabinet_assistant/authentication/widget/signup_signin_suggestion.dart';
import 'package:cabinet_assistant/authentication/widget/padding_wrapper.dart';
import 'package:cabinet_assistant/routing/routing.dart';
import 'package:cabinet_assistant/utils/app_color.dart';
import 'package:cabinet_assistant/utils/app_constants.dart';
import 'package:cabinet_assistant/utils/common_enum.dart';
import 'package:cabinet_assistant/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberScreen extends ConsumerStatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends ConsumerState<PhoneNumberScreen> {
  final mobileNumberFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  bool isFormSubmitable = false;
  String mobileNumber = '';
  bool textError = false;

  @override
  void initState() {}

  // Lenght of moble number we get after validation -> 14
  void onMobileNumberChangeHandler() {
    if (mobileNumber.length == 10) {
      if (!isFormSubmitable) {
        setState(() {
          textError = false;
          isFormSubmitable = true;
        });
      }
    } else {
      setState(() {
        if (!textError) {
          textError = true;
        }
        if (isFormSubmitable) {
          isFormSubmitable = false;
        }
      });
    }
  }

  void mobileNumberSubmitHandler() async {
    print("Hey We Recived You're Mobile Number $mobileNumber");
    final authControllerProv =
        ref.read(authenticationControllerProvider.notifier);
    final res = await authControllerProv.getOtp(mobileNumber);
    if (res) {
      Navigator.of(context).pushNamed(Routing.otpScreen, arguments: {
        AppConstants.phoneNumber: mobileNumber,
        AppConstants.redirectScreen: ScreenRedirection.signInScreen,
      });
    }
  }

  void redirectSignInHandler() {
    Navigator.of(context).pushNamed(Routing.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authenticationControllerProvider);
    return LoadingScreen(
      displayError: auth.status == AuthenticationStatus.getOtpError,
      displayLoading: auth.status == AuthenticationStatus.getOtp,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: PaddingWrapper(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLogo(
                        welcomeTextRequired: true,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50.h),
                      ),
                      Text(
                        'Enter your phone number to start.',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                      ),
                      Text(
                        'We???ll send you OTP to verify your phone number.',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24.h),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.gray),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ic_usa_flag.svg',
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6.w),
                                    child: Text(
                                      '+1',
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: AppColor.gray,
                                    ),
                                    height: 56.h,
                                    width: 1.5.w,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                style: TextStyle(fontSize: 16.sp),
                                decoration: const InputDecoration(
                                  hintText: 'Phone Number',
                                  border: InputBorder.none,
                                ),
                                cursorColor: AppColor.black,
                                keyboardType: TextInputType.number,
                                inputFormatters: [mobileNumberFormatter],
                                onChanged: (String numberText) {
                                  mobileNumber = mobileNumberFormatter
                                      .unmaskText(numberText);
                                  onMobileNumberChangeHandler();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (textError)
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Text(
                            'Enter Valid Phone Number',
                            style: Theme.of(context).textTheme.errorText,
                          ),
                        ),
                      if (auth.status == AuthenticationStatus.getOtpSuccess &&
                          !auth.success)
                        Container(
                          margin: EdgeInsets.only(top: 16.h),
                          child: Text(
                            auth.message,
                            style: Theme.of(context).textTheme.errorText,
                          ),
                        )
                    ],
                  ),
                  SignupSigninSuggestion(
                    buttonText: 'Next',
                    submitHandler:
                        isFormSubmitable ? mobileNumberSubmitHandler : null,
                    formAction: FormAction.signin,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
