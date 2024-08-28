import 'package:btcare/core/api/api_response.dart';
import 'package:btcare/core/api/web_service.dart';
import 'package:btcare/core/error/error_handler.dart';
import 'package:btcare/core/model/login_body.dart';
import 'package:btcare/core/model/login_response.dart';
import 'package:btcare/core/model/signup_patient_body.dart';
import 'package:btcare/core/model/signup_patient_response.dart';
import 'package:btcare/features/patient/auth/data/auth_repo.dart';

class AuthRepoImplementation implements AuthPatientRepo {
  final WebServices webServices;
  AuthRepoImplementation({required this.webServices});
  @override
  Future<ApiResponse<LoginResponse>> login(
      {required LoginBody loginBody}) async {
    try {
      var data = await webServices.loginPatient(loginBody, );
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(error:ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<SignupResponse>> signUp({required SignupPatienBody signUpBody})async {
       try {
      var data = await webServices.signUpPatient(signUpBody);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(error: ErrorHandler.handle(e));
    }
  }

 
}
