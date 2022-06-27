import 'package:cabinet_assistant/login_screen/button_widget.dart';
import 'package:cabinet_assistant/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileNumberFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  bool isFormSubmitable = false;
  String mobileNumber = '';

  // Lenght of moble number we get after validation -> 14
  void onMobileNumberChangeHandler() {
    if (mobileNumber.length == 10) {
      if (!isFormSubmitable) {
        setState(() {
          isFormSubmitable = true;
        });
      }
    } else {
      if (isFormSubmitable) {
        setState(() {
          isFormSubmitable = false;
        });
      }
    }
    print(mobileNumber.length);
  }

  void mobileNumberChangeHandler() {
    print("Hey We Recived You're Mobile Number $mobileNumber");
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Center(
                      child: Container(

                        width: 195,
                        child: Column(
                          children: [
                            Text(
                              'Welcome To',
                              style: Theme.of(context).textTheme.headline5,
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
                      margin: const EdgeInsets.only(top: 40),
                    ),
                    Text(
                      'Enter your phone number to start.',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                    ),
                    Text(
                      'We’ll send you OTP to verify your phone number.',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_usa_flag.svg',
                                  fit: BoxFit.contain,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(
                                    '+1',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: AppColor.gray,
                                  ),
                                  height: 60,
                                  width: 1.5,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: TextField(

                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(
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
                  ],
                ),
              ),
              Column(
                children: [
                  ButtonWidget(
                    text: 'Next',
                    onPressed:
                        isFormSubmitable ? mobileNumberChangeHandler : null,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                  ),
                  Text(
                    'Already have an account? Sign in.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
