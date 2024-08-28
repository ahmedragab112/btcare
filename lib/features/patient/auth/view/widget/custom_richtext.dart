import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.style1,
      required this.style2,
      this.onTap});

  final String text1;
  final String text2;
  final TextStyle style1;
  final TextStyle style2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 237.w,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: text1,
            style: style1,
          ),
          TextSpan(
              text: text2,
              style: style2,
              recognizer: TapGestureRecognizer()..onTap = onTap)
        ]),
      ),
    );
  }
}
