import 'package:cabinet_assistant/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeText {
  const ThemeText._();

  static TextStyle get _proximaNova => const TextStyle(
        fontFamily: 'Proxima Nova',
      );

  static TextStyle get _blackSubTitle1 => _proximaNova.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      );
  static TextStyle get _blackSubTitle2 => _proximaNova.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
  );
  static TextStyle get _blackHeadline5 => _proximaNova.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColor.lightBlack,
  );
  static TextStyle get _blackHeadline6 => _blackHeadline5.copyWith(
    fontSize: 12.sp,
  );
  static TextStyle get _blueButton => _proximaNova.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: Colors.white,
  );

  static getTextTheme() => TextTheme(
    button: _blueButton,
    headline5: _blackHeadline5,
    headline6: _blackHeadline6,
    subtitle1: _blackSubTitle1,
    subtitle2: _blackSubTitle2,
  );
}

extension ThemeTextExtension on TextTheme{
  TextStyle get blueHeadline5 => ThemeText._blackHeadline5.copyWith(
    color: AppColor.darkBlue,
  );

  TextStyle get errorText => ThemeText._blackHeadline5.copyWith(
    color: Colors.red,
  );
}
