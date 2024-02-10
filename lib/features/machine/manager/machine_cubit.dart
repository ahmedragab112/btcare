import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:btcare/core/helper/image_picker.dart';
import 'package:btcare/features/machine/data/repo/machine_repo_implemenation.dart';
import 'package:equatable/equatable.dart';

part 'machine_state.dart';

class MachineCubit extends Cubit<MachineState> {
  MachineRepoImplementation machineRepo;
  File? galleryImage;
  String? result;
  MachineCubit(this.machineRepo) : super(MachineInitial());
  Future<void> pickGalleryImage() async {
    emit(MachineInitial());
    galleryImage = await PickImage.galleryPick();
    emit(UploadImage());
    log(galleryImage!.path);
  }

  Future<void> uploadImage() async {
    emit(MachineLoading());
    var data = await machineRepo.uploadImage(galleryImage!);
    data.when(
      data: (data) {
        result = data.result;
        emit(MachineSuccess());
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
  }
}
