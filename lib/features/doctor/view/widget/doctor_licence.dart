import 'package:btcare/core/utils/color/app_color.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/core/utils/styles/app_textstyle.dart';
import 'package:btcare/features/doctor/manager/doctor_auth_cubit.dart';
import 'package:btcare/features/doctor/manager/doctor_auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorLicence extends StatelessWidget {
  const DoctorLicence({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAuthCubit, DoctorAuthState>(
      builder: (context, state) {
        var cubit = context.read<DoctorAuthCubit>();
        return GestureDetector(
          onTap: () async {
            await cubit.pickGalleryImage();
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColor.textFiledFiledColor.withOpacity(.30),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5, offset: Offset(0, 5), color: Colors.grey)
                  ],
                ),
                child: cubit.galleryImage == null
                    ? Image.asset(
                        'assets/images/doctor_licence.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      )
                    : Image.file(
                        cubit.galleryImage!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
              ),
              cubit.galleryImage == null
                  ? Positioned(
                      bottom: 10,
                      child: Text(
                        AppString.clickHereToUploadYourMedicalLicence,
                        style: AppTextStyle.font20InterGreyBold
                            .copyWith(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
