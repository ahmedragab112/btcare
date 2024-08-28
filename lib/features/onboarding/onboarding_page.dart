import 'package:btcare/config/router/routes.dart';
import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/onboarding/model/onbarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            index == 1
                ? GestureDetector(
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          color: Color(0xff03A1A4),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.end,
                    ),
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.choseLoginWay);
                    },
                  )
                : GestureDetector(
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          color: Color(0xff03A1A4),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.end,
                    ),
                    onTap: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Easing.linear);
                    },
                  ),
            Expanded(
              child: PageView.builder(
                itemCount: data.length,
                onPageChanged: (value) {
                  index = value;
                  setState(() {});
                },
                controller: controller,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      data[index].image,
                      width: 300.w,
                      height: 300.h,
                      fit: BoxFit.fill,
                    ),
                    const VerticalSpace(40),
                    Text(
                      data[index].text,
                      style: const TextStyle(
                        color: Color(0xff03A1A4),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            const VerticalSpace(100),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: index,
                count: data.length,
                effect: const WormEffect(
                    activeDotColor: Color(0xff03A1A4),
                    dotWidth: 10,
                    dotHeight: 10),
              ),
            ),
            const VerticalSpace(100),
          ],
        ).setPadding(context, horizontal: 17, vertical: 30),
      ),
    );
  }
}
