import 'dart:io';

import 'package:btcare/core/cache/cache_helper.dart';
import 'package:btcare/core/model/signup_doctor_response.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/features/doctor/manager/doctor_auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/image_picker.dart';
import '../../../core/model/login_body.dart';
import '../../../core/model/login_doctor_response.dart';
import '../data/auth_repo.dart';

class DoctorAuthCubit extends Cubit<DoctorAuthState> {
  DoctorAuthCubit({required this.repo}) : super(AuthInit());
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController signUpNameController = TextEditingController();
  final TextEditingController signUppasswordController =
      TextEditingController();
  final TextEditingController signUpconfirmPasswordController =
      TextEditingController();
  final TextEditingController signUpemailController = TextEditingController();
  final TextEditingController signUpphoneController = TextEditingController();
  LoginDoctorResponse? loginDoctorResponse;
  final DoctorAuthRepo repo;
  File? galleryImage;
  SignUpDoctorResponse? signUpDoctorResponse;

  Future<void> pickCameraImage() async {
    emit(AuthInit());
    galleryImage = await PickImage.cameraPick();
    emit(LicenceUpdated());
  }

  Future<void> pickGalleryImage() async {
    emit(AuthInit());
    galleryImage = await PickImage.galleryPick();
    emit(LicenceUpdated());
  }

  Future<void> login() async {
    emit(AuthLoginLoading());

    var data = await repo.login(
        loginBody: LoginBody(
      password: loginPasswordController.text,
      username: loginEmailController.text,
    ));
    data.when(
      data: (data) async {
        loginDoctorResponse = data;
        await CacheHelper().setInstance(
            data: data.data!.token!, key: AppString.accessTokenKey);

        emit(AuthLoginSuccess());
      },
      error: (error) {
        emit(AuthLoginError(error: error.apiErrorModel.message!));
      },
    );
  }

  Future<void> signUp() async {
    emit(AuthSignupLoading());
    var data = await repo.signUp(
        confirmPassword: signUpconfirmPasswordController.text,
        email: signUpemailController.text,
        license: galleryImage,
        name: signUpNameController.text,
        password: signUppasswordController.text);
    data.when(
      data: (data) async {
        signUpDoctorResponse = data;
        await CacheHelper().setInstance(
            data: data.data!.token!, key: AppString.accessTokenKey);
        emit(AuthSignUpSuccess());
      },
      error: (error) {
        emit(AuthSignupError(error: error.apiErrorModel.message!));
      },
    );
  }
}
