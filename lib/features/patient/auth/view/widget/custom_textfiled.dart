import 'package:btcare/core/utils/color/app_color.dart';
import 'package:btcare/core/utils/styles/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key, required this.hintText, required this.prefixIconData, required this.controller, this.validator});
  final String hintText;
  final IconData prefixIconData;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      controller: controller,
      style: AppTextStyle.font13InterPrimeryMedium,
      decoration: InputDecoration(
        hintStyle: AppTextStyle.font13InterPrimeryMedium,
        prefixIcon: Icon(prefixIconData),
        hintText: hintText,
        fillColor: AppColor.textFiledFiledColor,
        filled: true,
        prefixIconColor: AppColor.primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
