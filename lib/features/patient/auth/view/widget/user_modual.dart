import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_icon.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_type_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserModual extends StatelessWidget {
  const UserModual({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIcon(icon: icon),
        const VerticalSpace(60),
        CustomButton(
       
          widget: Text(
                   text
                  ,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 20.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          onTap: () {
            onTap();
          },
        )
      ],
    );
  }
}
