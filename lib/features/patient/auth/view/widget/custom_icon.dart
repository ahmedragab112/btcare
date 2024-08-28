import 'package:btcare/core/utils/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 120.w,
      color: AppColor.primaryColor,
      shadows: const [
        Shadow(
          color: Colors.black,
          blurRadius: 5.0,
          offset: Offset(0, 2),
        ),
      ],
    );
  }
}
