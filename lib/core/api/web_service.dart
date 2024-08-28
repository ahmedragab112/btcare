import 'dart:io';

import 'package:btcare/core/model/add_chat_response.dart';
import 'package:btcare/core/model/get_allprofiles_response.dart';
import 'package:btcare/core/model/login_body.dart';
import 'package:btcare/core/model/login_doctor_response.dart';
import 'package:btcare/core/model/login_response.dart';
import 'package:btcare/core/model/message_body.dart';
import 'package:btcare/core/model/search_for_doctor_response.dart';
import 'package:btcare/core/model/signup_doctor_response.dart';
import 'package:btcare/core/model/signup_patient_body.dart';
import 'package:btcare/core/model/signup_patient_response.dart';
import 'package:btcare/core/model/update_profile_response.dart';
import 'package:btcare/features/patient/machine/data/models/all_chat_messages.dart';
import 'package:btcare/features/patient/machine/data/models/doctor_details_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'web_service.g.dart';

@RestApi(baseUrl: 'https://09d4-196-128-14-73.ngrok-free.app/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @POST('/users/register/doctor/')
  @MultiPart()
  Future<SignUpDoctorResponse> signUpDoctor({
    @Part(name: 'username') String? name,
    @Part(name: 'email') String? email,
    @Part(name: 'password') String? password,
    @Part(name: 'confirm_password') String? confirmPassword,
    @Part(name: 'certificate_image') File? license,
  });
  @POST('/users/login/')
  Future<LoginDoctorResponse> loginDoctor(
      @Body() LoginBody loginBody, @Header('Authorization') String token);
  @POST('/users/register/patient/')
  Future<SignupResponse> signUpPatient(
    @Body() SignupPatienBody signupPatienBody,
  );

  @GET('/profile/doctor/{id}/')
  Future<DoctorDetailsModel> doctorDetails(
      @Path('id') int id, @Header('Authorization') String token);
  @POST('/users/login/')
  Future<LoginResponse> loginPatient(@Body() LoginBody loginBody);

  @POST('/chat/chats/')
  Future<AddChatResponse> addChat(
      @Query('doctor_id') int doctorId, @Header('Authorization') String token);

  @GET('/chat/chats/')
  Future<List<AddChatResponse>> getAllChats(
      @Header('Authorization') String token);

  @GET('/chat/chats/{id}/messages/')
  Future<List<AllChatMessagesModel>> getMessage(
      @Path('id') int id, @Header('Authorization') String token);
  @POST('/chat/chats/{id}/messages/')
  Future<AllChatMessagesModel> sendMessageToChat(@Path('id') int id,
      @Body() MessageBody messageBody, @Header('Authorization') String token);

  @GET('/chat/search/')
  Future<SearchForDoctorResponse> searchForDoctor(
      @Query('query') String doctorName, @Header('Authorization') String token);

  @GET('/profile/Alldoctors/')
  Future<List<GetAllProfileResponse>> getAllProfiles(
      @Header('Authorization') String token);

  @PUT('/profile/profiles/{id}/')
  @MultiPart()
  Future<UpdateProfileResponse> updateUserProfile(@Path('id') int id,
      {@Part(name: 'username') String? name,
      @Part(name: 'email') String? email,
      @Part(name: 'password') String? password,
      @Part(name: 'confirm_password') String? confirmPassword,
      @Part(name: 'certificate_image') File? license,
      @Header('Authorization') required String token});
}
