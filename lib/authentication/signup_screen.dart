import 'package:cabinet_assistant/authentication/widget/padding_wrapper.dart';
import 'package:cabinet_assistant/authentication/widget/tearms_and_privacy.dart';
import 'package:cabinet_assistant/authentication/widget/text_field.dart';
import 'package:cabinet_assistant/routing/routing.dart';
import 'package:cabinet_assistant/utils/app_color.dart';
import 'package:cabinet_assistant/utils/text_theme.dart';
import 'package:cabinet_assistant/widgets/button_widget.dart';
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
      Navigator.of(context).pushNamed(Routing.signInScreen);
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
                      errorMessage: nameError,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    BlinkTextField(
                      fieldName: 'Email',
                      textInputType: TextInputType.emailAddress,
                      validator: emailValidator,
                      errorMessage: emailError,
                    ),

                    SizedBox(
                      height: 16.h,
                    ),
                    BlinkTextField(
                      fieldName: 'Password',
                      textInputType: TextInputType.text,
                      isPasswordField: true,
                      validator: passwordValidator,
                      errorMessage: passwordError,
                    ),

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
                    const TearmsAndPrivacy(),
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
      ),
    );
  }
}

enum User {
  contractor,
  homeowner,
}
