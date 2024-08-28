import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void testDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.question,
    body: const Center(
      child: Text(
        'Select Way To Upload Image',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
    btnOkIcon: Icons.camera,
    btnCancelIcon: Icons.image,
    btnOkText: 'Camera',
    btnCancelText: 'Gallery',
    btnOkOnPress: () async {
      await context.read<HomeCubit>().pickCameraImage();
    },
    btnCancelOnPress: () async {
      await context.read<HomeCubit>().pickGalleryImage();
    },
  ).show();
}
