import 'package:btcare/config/router/routes.dart';
import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/helper/validation.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/core/utils/styles/app_textstyle.dart';
import 'package:btcare/features/patient/auth/manager/auth_cubit.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_lisner.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_richtext.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_type_btn.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/utils/spaceing/spaceing.dart';
import '../widget/custom_textfiled.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpPatientCubit>();
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: cubit.formKey,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: VerticalSpace(155),
            ),
            SliverToBoxAdapter(
              child: Image.asset(
                'assets/images/loginbrain.png',
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
            const SliverToBoxAdapter(
              child: VerticalSpace(30),
            ),
            SliverToBoxAdapter(
              child: Text(
                AppString.login,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    },
                    hintText: AppString.email,
                    prefixIconData: Icons.email,
                    controller: cubit.loginEmailController,
                  ),
                  const VerticalSpace(16),
                  CustomTextFiled(
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    hintText: AppString.password,
                    prefixIconData: Icons.lock,
                    controller: cubit.loginPasswordController,
                  ),
                  const VerticalSpace(15),
                  CustomButton(
                    widget: Text(
                      AppString.login,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 20.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () async {
                      if (cubit.formKey.currentState!.validate()) {
                        await cubit.login();
                      }
                    },
                  ),
                  const VerticalSpace(20),
                  const CustomLisner(),
                  CustomRichText(
                    text1: AppString.dontHaveAnAccount,
                    text2: AppString.signup,
                    style2: AppTextStyle.font13InterPrimeryMedium,
                    style1: AppTextStyle.font20InterGreyBold
                        .copyWith(fontSize: 13.sp),
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.signUpPatient);
                    },
                  ),
                ],
              ),
            )
          ],
        ).setPadding(context, horizontal: 41, vertical: 20),
      ),
    );
  }
}
