

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingWrapper extends StatelessWidget {
  final Widget child;
  const PaddingWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w,right: 16.w,top:16.h,bottom: 30.65.h),
      child: child,
    );
  }
}
