import 'dart:io';

import 'package:btcare/core/api/api_response.dart';
import 'package:btcare/core/model/add_chat_response.dart';
import 'package:btcare/core/model/get_allprofiles_response.dart';
import 'package:btcare/core/model/message_body.dart';
import 'package:btcare/features/patient/machine/data/models/all_chat_messages.dart';
import 'package:btcare/features/patient/machine/data/models/api_response.dart';
import 'package:btcare/features/patient/machine/data/models/doctor_details_model.dart';

abstract class MachineRepo {
  Future<ApiResponse<MachineResponse>> uploadImage(File image);
  Future<ApiResponse<List<GetAllProfileResponse>>> getAllDoctors();
  Future<ApiResponse<DoctorDetailsModel>> getDoctorDetails(int id);
  Future<ApiResponse<AddChatResponse>> addChat(int doctorId);
  Future<ApiResponse<List<AddChatResponse>>> getAllChats();
  Future<ApiResponse<List<AllChatMessagesModel>>> getChatMessages(int chatId);
  Future<ApiResponse<AllChatMessagesModel>> sendMessage(MessageBody message, int chatId);
}
