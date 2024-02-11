import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:btcare/core/helper/image_picker.dart';
import 'package:btcare/features/machine/data/models/api_response.dart';
import 'package:btcare/features/machine/data/repo/machine_repo_implemenation.dart';
import 'package:equatable/equatable.dart';

part 'machine_state.dart';

class MachineCubit extends Cubit<MachineState> {
  MachineRepoImplementation machineRepo;
  File? galleryImage;

  MachineCubit(this.machineRepo) : super(MachineInitial());
  Future<void> pickCameraImage() async {
    emit(MachineInitial());
    galleryImage = await PickImage.cameraPick();
    emit(UploadImage());
  }

  Future<void> pickGalleryImage() async {
    emit(MachineInitial());
    galleryImage = await PickImage.galleryPick();
    emit(UploadImage());
  }

  Future<void> uploadImage() async {
    emit(MachineLoading());
    if (galleryImage != null) {
      var data = await machineRepo.uploadImage(galleryImage!);
      data.when(
        data: (data) {
          emit(MachineSuccess(data: data));
        },
        error: (error) {
          log(error);
          emit(
            MachineFailed(
              error: error,
            ),
          );
        },
      );
    } else {
      emit(const UploadImageFailed(error: 'please select image first'));
    }
  }
}
