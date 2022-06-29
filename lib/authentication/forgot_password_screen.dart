import 'package:cabinet_assistant/authentication/widget/padding_wrapper.dart';
import 'package:cabinet_assistant/authentication/widget/text_field.dart';
import 'package:cabinet_assistant/routing/routing.dart';
import 'package:cabinet_assistant/utils/app_constants.dart';
import 'package:cabinet_assistant/utils/common_enum.dart';
import 'package:cabinet_assistant/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String? phoneNumber,phoneNumberError;
  bool isValid = false;


  void phoneNumberValidator(String phoneNumber) {
    this.phoneNumber = phoneNumber;
    setState(() {
      if (phoneNumber.length == 10) {
        isValid = true;
        phoneNumberError = null;
      } else {
        isValid = false;
        phoneNumberError = 'Enter Valid Phone Number';
      }
    });
  }

  void submitOtpHandler(){
    phoneNumberValidator(phoneNumber??'');

    if(phoneNumberError==null){

      Navigator.of(context).pushNamed(Routing.otpScreen,arguments: {
        AppConstants.phoneNumber: phoneNumber,
        AppConstants.redirectScreen: ScreenRedirection.confirmPasswordScreen,
      });
    }
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
              'Forgot password.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Enter your mobile number and we’ll send the OTP',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'code to entered mobile number to reset password.',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 20.h,),
            BlinkTextField(
              fieldName: 'Your Phone Number',
              textInputType: TextInputType.number,
              validator: phoneNumberValidator,
              isPhoneNumberField: true,
              errorMessage: phoneNumberError,
            ),
            SizedBox(height: 16.h,),
            ButtonWidget(text: 'Send OTP',onPressed: isValid?submitOtpHandler:null,)
          ],
        ),
      ),
    );
  }
}
