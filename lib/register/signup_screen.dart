import 'package:cabinet_assistant/register/padding_wrapper.dart';
import 'package:cabinet_assistant/utils/app_color.dart';
import 'package:cabinet_assistant/utils/text_theme.dart';
import 'package:cabinet_assistant/widgets/button_widget.dart';
import 'package:cabinet_assistant/widgets/linkable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool isEmailEmpty = true;
  User user = User.homeowner;

  String? email,name,password;

  String? emailError,nameError,passwordError;

  void nameValidator(String text){
    name = text.trimLeft();
    name = name?.trimRight();
    setState((){
      if(name==null || name!.isEmpty){
        nameError ='Name Should Not Be Empty';
      }
      else {
        nameError = null;
      }
    });
  }

  void emailValidator(String email){
    this.email = email;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    setState((){
      if(!emailValid){
        emailError = 'Enter Valid Email Address';
      }
      else {
        emailError= null;
      }
    });
  }

  void passwordValidator(String password){
    this.password = password;
    bool passwordValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password);
    setState((){
      if(!passwordValid){
        passwordError= 'Enter Valid Password';
      }
      else {
        passwordError=  null;
      }
    });
  }
  void signUpSubmitHandler(){
    nameValidator(name??'');
    emailValidator(email??'');
    passwordValidator(password??'');
    if(nameError==null && emailError==null && passwordError==null){
      print("Data Recived");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: PaddingWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let’s introduce yourself.',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Enter your basic information.',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  BlinkTextField(

                    fieldName: 'Your Name',
                    textInputType: TextInputType.name, validator: nameValidator,
                  ),
                  if(nameError!=null)
                    ErrorText(errorText: nameError??'',),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlinkTextField(
                    fieldName: 'Email',
                    textInputType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),
                  if(emailError!=null)
                    ErrorText(errorText: emailError??'',),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlinkTextField(
                    fieldName: 'Password',
                    textInputType: TextInputType.text,
                    isPasswordField: true,
                    validator: passwordValidator,
                  ),
                  if(passwordError!=null)
                    ErrorText(errorText: passwordError??'',),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    'I\'m a',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            user = User.contractor;
                          });
                        },
                        child: Container(
                          height: 56.h,
                          width: 160.w,
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: AppColor.lightGray,
                            border: Border.all(color: AppColor.gray),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Contractor',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              user == User.contractor
                                  ? const Icon(
                                      Icons.check_circle_sharp,
                                      color: AppColor.blue,
                                    )
                                  : const Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                    ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            user = User.homeowner;
                          });
                        },
                        child: Container(
                          height: 56.h,
                          width: 160.w,
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: AppColor.lightGray,
                            border: Border.all(color: AppColor.gray),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Homeowner',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              user == User.homeowner
                                  ? const Icon(
                                      Icons.check_circle_sharp,
                                      color: AppColor.blue,
                                    )
                                  : const Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 180.h,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Text(
                        'By creating an acount you agree to the',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LinkableText(
                              text: 'Tearms of use ', onPressed: () {}),
                          Padding(
                            padding: EdgeInsets.only(bottom: 3.w),
                            child: Text(
                              ' and ',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          LinkableText(
                              text: ' Privacy policy', onPressed: () {

                          }),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  ButtonWidget(text: 'Sign Up',onPressed: (nameError==null && emailError==null && passwordError==null)?signUpSubmitHandler:null,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum User {
  contractor,
  homeowner,
}

class BlinkTextField extends StatefulWidget {
  const BlinkTextField({
    Key? key,
    required this.fieldName,
    this.isPasswordField = false,
    required this.textInputType,
    required this.validator,
  }) : super(key: key);


  final String fieldName;
  final bool isPasswordField;
  final TextInputType textInputType;
  final Function validator;

  @override
  State<BlinkTextField> createState() => _BlinkTextFieldState();
}

class _BlinkTextFieldState extends State<BlinkTextField> {
  bool isFieldEmpty = true;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344.w,
      height: 56.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.gray),
        borderRadius: BorderRadius.circular(4.r),
        color: isFieldEmpty ? AppColor.lightGray : AppColor.transparent,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: _showShowPassword(),
              keyboardType: widget.textInputType,
              onChanged: (String text) {
                setState(() {
                  isFieldEmpty = text.isEmpty;
                });
                widget.validator(text);
              },
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.fieldName,
              ),
              cursorColor: AppColor.black,
            ),
          ),
          if (widget.isPasswordField)
            GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              child: isPasswordVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.remove_red_eye_rounded),
            ),
        ],
      ),
    );
  }

  bool _showShowPassword() {
    if (isPasswordVisible) {
      return false;
    } else {
      return widget.isPasswordField;
    }
  }
}

class ErrorText extends StatelessWidget {
  final String errorText;
  const ErrorText({Key? key, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      errorText,
      style: Theme.of(context).textTheme.errorText,
    );
  }
}
