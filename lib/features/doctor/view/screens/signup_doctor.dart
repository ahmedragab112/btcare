import 'package:btcare/config/router/routes.dart';
import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/core/utils/styles/app_textstyle.dart';
import 'package:btcare/features/doctor/view/widget/custom_lisner.dart';
import 'package:btcare/features/doctor/view/widget/doctor_licence.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_richtext.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_textfiled.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_type_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpDoctor extends StatelessWidget {
  const SignUpDoctor({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              AppString.register,
              style: AppTextStyle.font36InterPrimeryBold,
              textAlign: TextAlign.center,
            ),
          ),
          const SliverToBoxAdapter(
            child: VerticalSpace(22),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppString.createAccount,
              style: AppTextStyle.font20InterGreyBold,
              textAlign: TextAlign.center,
            ),
          ),
          const SliverToBoxAdapter(
            child: VerticalSpace(30),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomTextFiled(
                  hintText: AppString.fullName,
                  prefixIconData: Icons.person,
                  controller: TextEditingController(),
                ),
                const VerticalSpace(16),
                CustomTextFiled(
                  hintText: AppString.email,
                  prefixIconData: Icons.email,
                  controller: TextEditingController(),
                ),
                const VerticalSpace(16),
                CustomTextFiled(
                  hintText: AppString.password,
                  prefixIconData: Icons.lock,
                  controller: TextEditingController(),
                ),
                const VerticalSpace(16),
                CustomTextFiled(
                  hintText: AppString.confirmPassword,
                  prefixIconData: Icons.lock,
                  controller: TextEditingController(),
                ),
                const VerticalSpace(42),
                const DoctorLicence(),
                const VerticalSpace(12),
                CustomRichText(
                  text1: 'By Signup you agree to our',
                  text2: ' Team of use and privacy notice',
                  style1: AppTextStyle.font13InterPrimeryMedium,
                  style2: AppTextStyle.font20InterGreyBold
                      .copyWith(fontSize: 13.sp),
                ),
                const VerticalSpace(15),
                CustomButton(
                  widget: Text(
                    AppString.signup,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 20.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {},
                ),
                const CustomLisner(),
                const VerticalSpace(20),
                CustomRichText(
                  text1: AppString.alreadyHaveAccount,
                  text2: AppString.login,
                  style2: AppTextStyle.font13InterPrimeryMedium,
                  style1: AppTextStyle.font20InterGreyBold
                      .copyWith(fontSize: 13.sp),
                  onTap: () {
                    context.pushReplacementNamed(AppRoutes.loginDoctor);
                  },
                ),
              ],
            ),
          )
        ],
      ).setPadding(context, horizontal: 41, vertical: 20),
    );
  }
}
