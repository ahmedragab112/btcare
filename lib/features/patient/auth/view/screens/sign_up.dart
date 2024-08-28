import 'package:btcare/config/router/routes.dart';
import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/core/utils/styles/app_textstyle.dart';
import 'package:btcare/features/patient/auth/manager/auth_cubit.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_lisner.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_textfiled.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_type_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/validation.dart';
import '../widget/custom_richtext.dart';

class SignUpPatient extends StatelessWidget {
  const SignUpPatient({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpPatientCubit>();
    return Scaffold(
        body: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: cubit.signUpFormKey,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: VerticalSpace(155),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppString.registerDoctor,
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
                  controller: cubit.signUpNameController,
                ),
                const VerticalSpace(16),
                CustomTextFiled(
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Please enter email';
                    } else if (!AppRegex.isEmailValid(value ?? '')) {
                      return AppStrings.pleaseEnterValidEmail;
                    }
                    return null;
                  },
                  hintText: AppString.email,
                  prefixIconData: Icons.email,
                  controller: cubit.signUpemailController,
                ),
                const CustomLisner(),
                const VerticalSpace(16),
                CustomTextFiled(
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Please enter password';
                    } else if (!AppRegex.hasLowerCase(value ?? '')) {
                      return AppStrings.enterLowerAtLeastOneLowerCase;
                    } else if (!AppRegex.hasNumber(value ?? '')) {
                      return AppStrings.enterAtLeastOneNumber;
                    } else if (!AppRegex.hasMinLength(value ?? '')) {
                      return AppStrings.enterAtLeast8Characters;
                    } else if (!AppRegex.hasUpperCase(value ?? '')) {
                      return AppStrings.enterUpperAtLeastOneUpperCase;
                    }
                    return null;
                  },
                  hintText: AppString.password,
                  controller: cubit.signUppasswordController,
                  prefixIconData: Icons.lock,
                ),
                const VerticalSpace(16),
                CustomTextFiled(
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'please enter confirm password';
                    } else if (cubit.signUpconfirmPasswordController.text !=
                        cubit.signUppasswordController.text) {
                      return 'password not match';
                    }
                    return null;
                  },
                  hintText: AppString.confirmPassword,
                  controller: cubit.signUpconfirmPasswordController,
                  prefixIconData: Icons.lock,
                ),
                const VerticalSpace(42),
                CustomRichText(
                  text1: 'By signing you agree to our',
                  text2: ' Team of use and privacy notice',
                  style1: AppTextStyle.font13InterPrimeryMedium,
                  style2: AppTextStyle.font20InterGreyBold
                      .copyWith(fontSize: 13.sp),
                ),
                const VerticalSpace(15),
                CustomButton(
                  onTap: () async {
                    if (cubit.signUpFormKey.currentState!.validate()) {
                      await cubit.signUp();
                    }
                  },
                  widget: Text(
                    AppString.signup,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 20.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const VerticalSpace(20),
                CustomRichText(
                  text1: AppString.alreadyHaveAccount,
                  text2: AppString.login,
                  style2: AppTextStyle.font13InterPrimeryMedium,
                  style1: AppTextStyle.font20InterGreyBold
                      .copyWith(fontSize: 13.sp),
                  onTap: () {
                    context.pushReplacementNamed(AppRoutes.loginPatient);
                  },
                ),
              ],
            ),
          )
        ],
      ).setPadding(context, horizontal: 41, vertical: 20),
    ));
  }
}
