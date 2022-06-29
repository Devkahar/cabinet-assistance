
import 'package:cabinet_assistant/utils/text_theme.dart';
import 'package:flutter/material.dart';

import 'package:cabinet_assistant/utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BlinkTextField extends StatefulWidget {
  const BlinkTextField({
    Key? key,
    required this.fieldName,
    this.isPasswordField = false,
    this.isPhoneNumberField=false,
    required this.textInputType,
    required this.validator,
    this.errorMessage,
  }) : super(key: key);


  final String fieldName;
  final bool isPasswordField;
  final bool isPhoneNumberField;
  final TextInputType textInputType;
  final Function validator;
  final String? errorMessage;

  @override
  State<BlinkTextField> createState() => _BlinkTextFieldState();
}

class _BlinkTextFieldState extends State<BlinkTextField> {
  bool isFieldEmpty = true;
  bool isPasswordVisible = false;
  final mobileNumberFormatter = MaskTextInputFormatter(
    mask: '+1 ###-###-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                    if(widget.isPhoneNumberField){
                      text = mobileNumberFormatter.unmaskText(text);
                    }
                    widget.validator(text);
                  },

                  style: TextStyle(fontSize: 16.sp),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.fieldName,
                  ),
                  cursorColor: AppColor.black,
                  inputFormatters: widget.isPhoneNumberField?[mobileNumberFormatter]:[],
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
        ),
        if(widget.errorMessage!=null)
          Container(margin: EdgeInsets.only(top: 5.h),child: ErrorText(errorText: widget.errorMessage)),
      ],
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
  final String? errorText;
  const ErrorText({Key? key, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      errorText??'',
      style: Theme.of(context).textTheme.errorText,
    );
  }
}
