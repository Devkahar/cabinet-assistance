import 'package:cabinet_assistant/authentication/widget/padding_wrapper.dart';
import 'package:cabinet_assistant/authentication/widget/text_field.dart';
import 'package:cabinet_assistant/routing/routing.dart';
import 'package:cabinet_assistant/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  String? password, passwordError, confirmPassword, confirmPasswordError;

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

  void confirmPasswordValidator(String password) {
    confirmPassword = password;
    setState(() {
      if (confirmPassword != this.password) {
        confirmPasswordError = 'Password Does\'nt Match';
      } else {
        confirmPasswordError = null;
      }
    });
  }

  void signInRediectHandler() {
    Navigator.of(context).pushNamed(Routing.signInScreen);
  }

  void resetPasswordHandler() {
    passwordValidator(password ?? '');
    confirmPasswordValidator(confirmPassword ?? '');
    if (passwordError == null && confirmPasswordError == null) {
      signInDialog();
    }
  }

  void signInDialog() async {
    print('Called');
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>  Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Material(
              child: Container(
                height: 171.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 26.h),
                      height: 50.h,
                      width: 50.h,
                      child: SvgPicture.asset(
                        'assets/icons/check_circle.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.h),
                      child: Text(
                        'Password has been reset successfully.',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.h),
                      child: ButtonWidget(
                        text: 'Login in to account',
                        onPressed: signInRediectHandler,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: PaddingWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create new password',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Your new password must be different from previous\nused passwords.',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 18.h,
            ),
            BlinkTextField(
              fieldName: 'New Password',
              textInputType: TextInputType.text,
              validator: passwordValidator,
              isPasswordField: true,
              errorMessage: passwordError,
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              child: Text(
                'Must be at least 8 characters.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            BlinkTextField(
              fieldName: 'Confirm Password',
              textInputType: TextInputType.text,
              validator: confirmPasswordValidator,
              isPasswordField: true,
              errorMessage: confirmPasswordError,
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              child: Text(
                'Your password must be match with above entered one.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            ButtonWidget(
              text: 'Reset Password',
              onPressed: resetPasswordHandler,
            ),
          ],
        ),
      ),
    );
  }
}
