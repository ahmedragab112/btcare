import 'package:btcare/core/utils/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onTap, required this.widget});
  final Function()? onTap;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 13.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300),
            border: Border.all(color: Colors.white, width: 2),
            color: AppColor.primaryColor,
          ),
          child: widget),
    );
  }
}
