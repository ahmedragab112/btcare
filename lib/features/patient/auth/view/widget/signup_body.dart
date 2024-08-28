import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/core/utils/styles/app_textstyle.dart';
import 'package:btcare/features/patient/auth/view/widget/register_modual.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: VerticalSpace(155),
        ),
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
        const SliverToBoxAdapter(child: RegisterModual())
      ],
    ).setPadding(context, horizontal: 41, vertical: 20);
  }
}
