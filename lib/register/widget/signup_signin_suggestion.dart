import 'package:cabinet_assistant/utils/common_enum.dart';
import 'package:cabinet_assistant/widgets/button_widget.dart';
import 'package:cabinet_assistant/widgets/linkable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupSigninSuggestion extends StatelessWidget {
  final String buttonText;
  final Function? submitHandler;
  final bool forgotPasswordRequired;
  final FormAction formAction;
  const SignupSigninSuggestion({Key? key, required this.submitHandler, required this.buttonText,this.forgotPasswordRequired=false, required this.formAction})
      : super(key: key);

  void redirectSignInScreen() {

  }
  void redirectSignUpScreen() {

  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          text: 'Next',
          onPressed: submitHandler,
        ),
        Container(
          margin: EdgeInsets.only(top: 16.5.h),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Text(

                formAction==FormAction.signin?'Already have an account?':'Don’t have an account? ',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline5,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            if(formAction==FormAction.signin)
              LinkableText(
                text: 'Sign In.', onPressed: redirectSignInScreen),
            if(formAction==FormAction.signup) LinkableText(text: 'Sign Up.', onPressed: redirectSignUpScreen),
          ],
        ),
      ],
    );
  }
}
