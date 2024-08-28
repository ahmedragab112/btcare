import 'package:btcare/core/utils/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle font36InterPrimeryBold = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.primaryColor,
    fontFamily: 'Inter',
  );
  static TextStyle font20InterGreyBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.greyColor.withOpacity(.70),
    fontFamily: 'Inter',
  );
  static TextStyle font13InterPrimeryMedium = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor,
    fontFamily: 'Inter',
  );
}
