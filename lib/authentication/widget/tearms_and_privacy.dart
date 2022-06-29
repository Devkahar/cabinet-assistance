import 'package:cabinet_assistant/utils/common_enum.dart';
import 'package:cabinet_assistant/widgets/linkable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TearmsAndPrivacy extends StatelessWidget {
  const TearmsAndPrivacy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
      ],
    );
  }
}
