import 'dart:io';

import 'package:btcare/core/api/api_response.dart';
import 'package:btcare/core/api/web_service.dart';
import 'package:btcare/core/cache/cache_helper.dart';
import 'package:btcare/core/error/error_handler.dart';
import 'package:btcare/core/model/login_body.dart';
import 'package:btcare/core/model/login_doctor_response.dart';
import 'package:btcare/core/model/signup_doctor_response.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/features/doctor/data/auth_repo.dart';

class DoctorAuthRepoImplementation implements DoctorAuthRepo {
  WebServices webServices;
  DoctorAuthRepoImplementation({required this.webServices});
  @override
  Future<ApiResponse<LoginDoctorResponse>> login({required LoginBody loginBody}) async{
  try {
    var data= await webServices.loginDoctor(loginBody, CacheHelper().getString(AppString.accessTokenKey));
    return ApiResponse.data(data);
  } catch (e) {
    return ApiResponse.error(error: ErrorHandler.handle(e));
  }
  }

  @override
  Future<ApiResponse<SignUpDoctorResponse>> signUp({required String? name, required String? email, required String? password, required String? confirmPassword, required File? license}) async{
   try {
     var data= await webServices.signUpDoctor(name: name, email: email, password: password, confirmPassword: confirmPassword, license: license);
     return ApiResponse.data(data);
   } catch (e) {
     
     return ApiResponse.error(error: ErrorHandler.handle(e));
   }
  }
  
  
}
