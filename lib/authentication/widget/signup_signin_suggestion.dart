import 'package:cabinet_assistant/routing/routing.dart';
import 'package:cabinet_assistant/utils/common_enum.dart';
import 'package:cabinet_assistant/widgets/button_widget.dart';
import 'package:cabinet_assistant/widgets/linkable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupSigninSuggestion extends StatefulWidget {
  final String buttonText;
  final Function? submitHandler;
  final bool forgotPasswordRequired;
  final FormAction formAction;

  const SignupSigninSuggestion(
      {Key? key,
      required this.submitHandler,
      required this.buttonText,
      this.forgotPasswordRequired = false,
      required this.formAction})
      : super(key: key);

  @override
  State<SignupSigninSuggestion> createState() => _SignupSigninSuggestionState();
}

class _SignupSigninSuggestionState extends State<SignupSigninSuggestion> {
  void redirectSignInScreen() {
    Navigator.of(context).pushNamed(Routing.signInScreen);
  }

  void redirectSignUpScreen() {
    Navigator.of(context).pushNamed(Routing.signUpScreen);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          text: widget.buttonText,
          onPressed: widget.submitHandler,
        ),
        Container(
          margin: EdgeInsets.only(top: 16.5.h),
        ),
        if (widget.formAction == FormAction.signup)
          Container(
            margin: EdgeInsets.only(bottom: 16.5.h),
            child: LinkableText(
              text: 'Forgot Password',
              onPressed: () {
                Navigator.of(context).pushNamed(Routing.forgotPasswordScreen);
              },
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Text(
                widget.formAction == FormAction.signin
                    ? 'Already have an account?'
                    : 'Don’t have an account? ',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            if (widget.formAction == FormAction.signin)
              LinkableText(text: 'Sign In.', onPressed: redirectSignInScreen),
            if (widget.formAction == FormAction.signup)
              LinkableText(text: 'Sign Up.', onPressed: redirectSignUpScreen),
          ],
        ),
      ],
    );
  }
}
