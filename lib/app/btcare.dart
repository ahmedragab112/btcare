import 'package:btcare/config/router/app_router.dart';
import 'package:btcare/config/router/routes.dart';
import 'package:btcare/config/theme/darktheme.dart';
import 'package:btcare/config/theme/lighttheme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtCare extends StatelessWidget {
  const BtCare({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        title: 'BT Care',
        theme:  LightTheme.lightTheme ,
        darkTheme: DarkTheme.darkTheme ,
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRouter.onGenrateRoute,
        initialRoute: AppRoutes.onBoarding,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
