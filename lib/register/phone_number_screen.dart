import 'package:cabinet_assistant/register/bottom_display_widget.dart';
import 'package:cabinet_assistant/register/padding_wrapper.dart';
import 'package:cabinet_assistant/routing/routing.dart';
import 'package:cabinet_assistant/utils/app_color.dart';
import 'package:cabinet_assistant/utils/text_theme.dart';
import 'package:cabinet_assistant/widgets/button_widget.dart';
import 'package:cabinet_assistant/widgets/linkable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);
  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final mobileNumberFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  bool isFormSubmitable = false;
  String mobileNumber = '';
  bool textError = false;

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

  void mobileNumberSubmitHandler() {
    // print("Hey We Recived You're Mobile Number $mobileNumber");
    Navigator.of(context).pushNamed(Routing.otpScreen,arguments: mobileNumber);
  }

  void redirectSignInHandler() {

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Colors.black
          ),
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
                    Center(
                      child: SizedBox(
                        width: 195.w,
                        child: Column(
                          children: [
                            Text(
                              'Welcome To',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SvgPicture.asset(
                              'assets/images/logo.svg',
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
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
                      'We’ll send you OTP to verify your phone number.',
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
                  ],
                ),
                BottomDisplay(submitHandler: isFormSubmitable?mobileNumberSubmitHandler:null,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
