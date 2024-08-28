import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:btcare/core/helper/image_picker.dart';
import 'package:btcare/core/model/add_chat_response.dart';
import 'package:btcare/core/model/get_allprofiles_response.dart';
import 'package:btcare/core/model/message_body.dart';
import 'package:btcare/features/patient/machine/data/models/all_chat_messages.dart';
import 'package:btcare/features/patient/machine/data/models/api_response.dart';
import 'package:btcare/features/patient/machine/data/models/doctor_details_model.dart';

import 'package:btcare/features/patient/machine/data/repo/machine_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'machine_state.dart';

class HomeCubit extends Cubit<HomeState> {
  MachineRepo machineRepo;
  int number = 1;
  TextEditingController messageController = TextEditingController();
  List<GetAllProfileResponse>? doctorsProfiles;
  DoctorDetailsModel? doctorDetailsModel;
  List<AddChatResponse>? getAllChatsResponse;
  AddChatResponse? addChatResponse;
  List<AllChatMessagesModel>? messages;

  File? galleryImage;
  Future<void> getDoctorDetails(int id) async {
    emit(GetDoctorDetailsLoading());
    var data = await machineRepo.getDoctorDetails(id);
    data.when(
      data: (data) {
        doctorDetailsModel = data;
        emit(GetDoctorDetailSuccess());
      },
      error: (error) {
        emit(GetDoctorDetailsError(error: error.apiErrorModel.message!));
      },
    );
  }

  HomeCubit(this.machineRepo) : super(MachineInitial());
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

  Future<void> getAllDoctors() async {
    emit(GetAllProfileLoading());
    var res = await machineRepo.getAllDoctors();
    res.when(
      data: (data) {
        doctorsProfiles = data;
        emit(GetAllProfileSuccess());
      },
      error: (error) {
        emit(GetAllProfileError(error: error.apiErrorModel.message!));
      },
    );
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
          number++;
          emit(
            MachineFailed(
              error: error.apiErrorModel.message!,
            ),
          );
        },
      );
    } else {
      emit(const UploadImageFailed(error: 'please select image first'));
    }
  }

  Future<void> getAllChats() async {
    emit(GetAllChatsLoading());
    var data = await machineRepo.getAllChats();
    data.when(
      data: (data) {
        getAllChatsResponse = data;
        emit(GetAllChatsSuccess());
      },
      error: (error) {
        emit(GetAllProfileError(error: error.apiErrorModel.message!));
      },
    );
  }

  Future<void> addChat(int doctorId) async {
    emit(AddChatLoading());
    var data = await machineRepo.addChat(doctorId);
    data.when(
      data: (data) async {
        addChatResponse = data;
        emit(AddChatSuccess());
        await getAllChats();
      },
      error: (error) {
        emit(AddChatError(error: error.apiErrorModel.detail!));
      },
    );
  }

  Future<void> sendMessage(
      {required MessageBody messageBody, required int chatId}) async {
    emit(SendMessageLoading());
    var data = await machineRepo.sendMessage(messageBody, chatId);
    data.when(
      data: (data) async {
        emit(SendMessageSuccess());
        await getChatMessges(chatId);
      },
      error: (error) {
        emit(SendMessageError(error: error.apiErrorModel.message!));
      },
    );
  }

  Future<void> getChatMessges(int chatId) async {
    emit(GetChatMessagesLoading());
    var data = await machineRepo.getChatMessages(chatId);
    data.when(
      data: (data) {
        messages = data;
        emit(GetChatMessagesSuccess());
      },
      error: (error) {
        emit(GetChatMessagesError(error: error.apiErrorModel.message!));
      },
    );
  }
}
