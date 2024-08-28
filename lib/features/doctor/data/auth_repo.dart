import 'dart:io';

import 'package:btcare/core/api/api_response.dart';
import 'package:btcare/core/model/login_body.dart';
import 'package:btcare/core/model/login_doctor_response.dart';
import 'package:btcare/core/model/signup_doctor_response.dart';

abstract class DoctorAuthRepo {
  Future<ApiResponse<SignUpDoctorResponse>> signUp({
    required String? name,
    required String? email,
    required String? password,
    required String? confirmPassword,
    required File? license,
  });

  Future<ApiResponse<LoginDoctorResponse>> login({required LoginBody loginBody});
  
}
