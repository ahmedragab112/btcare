import 'dart:io';

import 'package:btcare/features/patient/machine/data/models/api_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:5000')
abstract class MachineWebService {
  factory MachineWebService(Dio dio, {String baseUrl}) = _MachineWebService;
  @POST('/upload')
  @MultiPart()
  Future<MachineResponse> uploadImage(@Part(name: 'image') File image);
}
