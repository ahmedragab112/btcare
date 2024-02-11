import 'package:btcare/features/machine/manager/machine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BlocBuilder<MachineCubit, MachineState>(
        builder: (context, state) {
          if (state is UploadImage) {
            return CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: context.read<MachineCubit>().galleryImage == null
                  ? null
                  : FileImage(context.read<MachineCubit>().galleryImage!),
              radius: 50,
              child: Center(
                child: context.read<MachineCubit>().galleryImage == null
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
