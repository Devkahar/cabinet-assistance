import 'package:cabinet_assistant/authentication/widget/app_logo.dart';
import 'package:cabinet_assistant/authentication/widget/padding_wrapper.dart';
import 'package:cabinet_assistant/authentication/widget/signup_signin_suggestion.dart';
import 'package:cabinet_assistant/authentication/widget/tearms_and_privacy.dart';
import 'package:cabinet_assistant/authentication/widget/text_field.dart';
import 'package:cabinet_assistant/utils/common_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? password, passwordError, phoneNumber, phoneError;
  late FocusNode focusNode;
  @override
  void initState(){
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose(){
    focusNode.dispose();
    super.dispose();
  }
  void passwordValidator(String password) {
    this.password = password;
    bool passwordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password);
    setState(() {
      if (!passwordValid) {
        passwordError = 'Enter Valid Password';
      } else {
        passwordError = null;
      }
    });
  }
  void phoneNumberValidator(String phoneNumber) {
    this.phoneNumber = phoneNumber;
    setState(() {
      if (phoneNumber.length != 10) {
        phoneError = 'Enter Valid Phone Number';
      } else {
        phoneError = null;
      }
    });
  }
  void signInHandler(){
    passwordValidator(password??'');
    phoneNumberValidator(phoneNumber??'');
    if(passwordError==null && phoneError==null){
      print('SignIn Successfull');
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: PaddingWrapper(
            child: Column(
              children: [
                Column(
                  children: [
                    const AppLogo(),
                    SizedBox(
                      height: 38.h,
                    ),
                    Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    BlinkTextField(
                      fieldName: 'Your Phone Number',
                      textInputType: TextInputType.number,
                      validator: phoneNumberValidator,
                      isPhoneNumberField: true,
                      errorMessage: phoneError,

                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    BlinkTextField(
                      fieldName: 'Password',
                      textInputType: TextInputType.text,
                      validator: passwordValidator,
                      isPasswordField: true,
                      errorMessage: passwordError,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SignupSigninSuggestion(
                      formAction: FormAction.signup,
                      buttonText: 'Sign In',
                      submitHandler: signInHandler,
                    ),
                  ],
                ),
                SizedBox(
                  height: 210.h,
                ),
                const TearmsAndPrivacy(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
