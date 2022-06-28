import 'package:cabinet_assistant/widgets/button_widget.dart';
import 'package:cabinet_assistant/widgets/linkable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomDisplay extends StatelessWidget {
  final Function? submitHandler;

  const BottomDisplay({Key? key, required this.submitHandler})
      : super(key: key);

  @override
  void redirectSignInHandler() {

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
                'Already have an account?',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline5,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            LinkableText(
                text: 'Sign In.', onPressed: redirectSignInHandler),
          ],
        ),
      ],
    );
  }
}
