import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:btcare/core/helper/image_picker.dart';
import 'package:btcare/features/machine/data/models/api_response.dart';
import 'package:btcare/features/machine/data/repo/machine_repo_implemenation.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'machine_state.dart';

class MachineCubit extends Cubit<MachineState> {
  MachineRepoImplementation machineRepo;
  File? galleryImage;

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
  }

  Future<void> getData() async {
    var data = FormData.fromMap({
      'image': [
        await MultipartFile.fromFile(galleryImage!.path,
            filename: galleryImage!.path.split('/').last),
      ],
    });

    var dio = Dio();
    var response = await dio.request(
      'http://localhost:5000/upload',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}
