import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NavigatorHelper on BuildContext {
  void push(Widget widget) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

 

  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void pushReplacement(Widget widget) {
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => widget));
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  void pushAndRemoveUntil(Widget widget) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (route) => false);
  }

  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false,
        arguments: arguments);
  }
}

extension PaddingToWidget on Widget {
  Widget setPadding(
    BuildContext context, {
    double vertical = 0,
    double horizontal = 0,
  }) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w),
      child: this,
    );
  }

  Widget setOnlyPadding(
    BuildContext context, {
    double bottom = 0,
    double left = 0,
    double right = 0,
    double top = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottom.h,
        left: left.w,
        right: right.w,
        top: top.h,
      ),
      child: this,
    );
  }

  Widget setAllPadding(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w, vertical: padding.h),
      child: this,
    );
  }
}

extension ShowSnakbar on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
