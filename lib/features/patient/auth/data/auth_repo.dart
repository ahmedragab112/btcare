import 'package:btcare/core/api/api_response.dart';
import 'package:btcare/core/model/login_body.dart';
import 'package:btcare/core/model/login_response.dart';
import 'package:btcare/core/model/signup_patient_body.dart';
import 'package:btcare/core/model/signup_patient_response.dart';

abstract class AuthPatientRepo {
  Future<ApiResponse<LoginResponse>> login({required LoginBody loginBody});
  Future<ApiResponse<SignupResponse>> signUp(
      {required SignupPatienBody signUpBody});
  
}
