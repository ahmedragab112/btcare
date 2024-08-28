import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is UploadImage) {
            return CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: context.read<HomeCubit>().galleryImage == null
                  ? null
                  : FileImage(context.read<HomeCubit>().galleryImage!),
              radius: 50,
              child: Center(
                child: context.read<HomeCubit>().galleryImage == null
                    ? const Icon(Icons.person, size: 100, color: Colors.white)
                    : null,
              ),
            );
          } else {
            return const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 50,
              child: Center(
                child: Icon(Icons.person, size: 100, color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
