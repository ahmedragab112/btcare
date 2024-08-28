import 'package:btcare/config/router/routes.dart';
import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/core/utils/styles/app_textstyle.dart';
import 'package:btcare/features/patient/auth/view/widget/user_modual.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChoseLoginWay extends StatelessWidget {
  const ChoseLoginWay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: VerticalSpace(227),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppString.choseLoginWay,
              style: AppTextStyle.font36InterPrimeryBold,
              textAlign: TextAlign.center,
            ),
          ),
          const SliverToBoxAdapter(
            child: VerticalSpace(20),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppString.choseWhichWayToRegister,
              style: AppTextStyle.font20InterGreyBold,
              textAlign: TextAlign.center,
            ),
          ),
          const SliverToBoxAdapter(
            child: VerticalSpace(114),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: UserModual(
                    icon: FontAwesomeIcons.userDoctor,
                    text: AppString.doctor,
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.signUpDoctor);
                    },
                  ),
                ),
                Expanded(
                  child: UserModual(
                    icon: FontAwesomeIcons.userLarge,
                    text: AppString.user,
                    onTap: () {
                      context.pushReplacementNamed(
                        AppRoutes.signUpPatient,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: UserModual(
                    icon: Icons.account_circle_rounded,
                    text: AppString.gest,
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.gestView);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: VerticalSpace(100),
          ),
        ],
      ),
    );
  }
}
