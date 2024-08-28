import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildXray extends StatelessWidget {
  const BuildXray({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              width: 380.w,
              height: 240.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: const Color(0xffD9D9D9).withOpacity(.60),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const VerticalSpace(68),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return context.read<HomeCubit>().galleryImage == null
                          ? Image.asset(
                              'assets/images/upload.png',
                              height: 64.h,
                              width: 64.w,
                              fit: BoxFit.fill,
                            )
                          : Container(
                              width: 64.w,
                              height: 64.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(context
                                          .read<HomeCubit>()
                                          .galleryImage!))));
                    },
                  ),
                  const VerticalSpace(32),
                  context.read<HomeCubit>().galleryImage == null
                      ? Text(
                          'upload your x-ray ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff666666).withOpacity(.70),
                          ),
                        )
                      : const SizedBox(),
                  const VerticalSpace(44),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
