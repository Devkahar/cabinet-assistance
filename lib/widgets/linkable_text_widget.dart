import 'package:cabinet_assistant/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cabinet_assistant/utils/app_color.dart';

class LinkableText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LinkableText({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.5.w, color: AppColor.darkBlue),
          ),
        ),
        padding: EdgeInsets.only(bottom: 2.h),
        child: Text(
          text,
          style: Theme.of(context).textTheme.blueHeadline5,
        ),
      ),
    );
  }
}
