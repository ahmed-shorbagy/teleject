import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static String fontFamily = 'Roboto';
  static TextStyle regular14 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static TextStyle regular12 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: Colors.white);
  static TextStyle regular10 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
  );
  static TextStyle medium14 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static TextStyle medium18 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
  );
  static TextStyle semiBold32 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 32.sp,
      color: Colors.white);
}
