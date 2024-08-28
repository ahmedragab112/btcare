import 'dart:developer';
import 'dart:io';
import 'package:btcare/core/api/api_response.dart';
import 'package:btcare/core/api/web_service.dart';
import 'package:btcare/core/cache/cache_helper.dart';
import 'package:btcare/core/error/error_handler.dart';
import 'package:btcare/core/model/add_chat_response.dart';
import 'package:btcare/core/model/get_allprofiles_response.dart';
import 'package:btcare/core/model/message_body.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/features/patient/machine/data/models/all_chat_messages.dart';
import 'package:btcare/features/patient/machine/data/models/api_response.dart';
import 'package:btcare/features/patient/machine/data/models/doctor_details_model.dart';
import 'package:btcare/features/patient/machine/data/repo/machine_repo.dart';
import 'package:btcare/features/patient/machine/data/service/api_service.dart';

class MachineRepoImplementation implements MachineRepo {
  MachineWebService machineWebService;
  WebServices webServices;
  MachineRepoImplementation(
      {required this.machineWebService, required this.webServices});
  @override
  Future<ApiResponse<MachineResponse>> uploadImage(File files) async {
    try {
      var data = await machineWebService.uploadImage(files);
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(error: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<List<GetAllProfileResponse>>> getAllDoctors() async {
    try {
      var data = await webServices.getAllProfiles(
          'Token ${CacheHelper().getString(AppString.accessTokenKey)}');
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(error: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<DoctorDetailsModel>> getDoctorDetails(int id) async {
    try {
      var data = await webServices.doctorDetails(
          id, 'Token ${CacheHelper().getString(AppString.accessTokenKey)}');
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(error: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<AddChatResponse>> addChat(int doctorId) async {
    try {
      var data = await webServices.addChat(doctorId,
          'Token ${CacheHelper().getString(AppString.accessTokenKey)}');
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(error: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<List<AddChatResponse>>> getAllChats() async {
    try {
      var data = await webServices.getAllChats(
          'Token ${CacheHelper().getString(AppString.accessTokenKey)}');
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(error: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<List<AllChatMessagesModel>>> getChatMessages(
      int chatId) async {
    try {
      var data = await webServices.getMessage(
          chatId, 'Token ${CacheHelper().getString(AppString.accessTokenKey)}');
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(error: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<AllChatMessagesModel>> sendMessage(
      MessageBody message, int chatId) async {
    try {
      var data = await webServices.sendMessageToChat(chatId, message,
          'Token ${CacheHelper().getString(AppString.accessTokenKey)}');
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(error: ErrorHandler.handle(e));
    }
  }
}
