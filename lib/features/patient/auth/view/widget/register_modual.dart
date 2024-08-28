import 'package:btcare/config/router/routes.dart';
import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/core/utils/styles/app_textstyle.dart';
import 'package:btcare/features/patient/auth/manager/auth_cubit.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_richtext.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_textfiled.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_type_btn.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterModual extends StatelessWidget {
  const RegisterModual({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpPatientCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
           CustomTextFiled(
            hintText: AppString.fullName,
            prefixIconData: Icons.person,
            controller: cubit.signUpNameController,
          ),
          const VerticalSpace(16),
           CustomTextFiled(
            hintText: AppString.email,
            prefixIconData: Icons.email,
            controller: cubit.signUpemailController,
          ),
          const VerticalSpace(16),
           CustomTextFiled(
            hintText: AppString.password,
            prefixIconData: Icons.lock,
            controller: cubit.signUppasswordController,
          ),
          const VerticalSpace(16),
           CustomTextFiled(
            hintText: AppString.confirmPassword,
            prefixIconData: Icons.lock,
            controller: cubit.signUpconfirmPasswordController,

          ),
          const VerticalSpace(42),
          CustomRichText(
            text1: 'By signing you agree to our',
            text2: ' Team of use and privacy notice',
            style1: AppTextStyle.font13InterPrimeryMedium,
            style2: AppTextStyle.font20InterGreyBold.copyWith(fontSize: 13.sp),
          ),
          const VerticalSpace(15),
          CustomButton(
            widget:  Text(
           AppString.signup,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 20.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
            onTap: () {
              cubit.signUp();
            },
          ),
          const VerticalSpace(20),
          CustomRichText(
            text1: AppString.alreadyHaveAccount,
            text2: AppString.login,
            style2: AppTextStyle.font13InterPrimeryMedium,
            style1: AppTextStyle.font20InterGreyBold.copyWith(fontSize: 13.sp),
            onTap: () {
              context.pushReplacementNamed(AppRoutes.loginPatient);
            },
          ),
        ],
      ),
    );
  }
}
