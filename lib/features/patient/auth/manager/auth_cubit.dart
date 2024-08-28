import 'package:bloc/bloc.dart';
import 'package:btcare/core/cache/cache_helper.dart';
import 'package:btcare/core/model/get_allprofiles_response.dart';
import 'package:btcare/core/model/login_body.dart';
import 'package:btcare/core/model/signup_patient_body.dart';
import 'package:btcare/core/utils/string/app_strings.dart';
import 'package:btcare/features/patient/auth/data/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class SignUpPatientCubit extends Cubit<AuthState> {
  SignUpPatientCubit({required this.authRepo}) : super(AuthInitial());
  var formKey = GlobalKey<FormState>();
  var signUpFormKey = GlobalKey<FormState>();

  AuthPatientRepo authRepo;
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController signUpNameController = TextEditingController();
  final TextEditingController signUppasswordController =
      TextEditingController();
  final TextEditingController signUpconfirmPasswordController =
      TextEditingController();
  final TextEditingController signUpemailController = TextEditingController();
  final TextEditingController signUpphoneController = TextEditingController();
  GetAllProfileResponse? doctorsProfiles;
  Future<void> login() async {
    emit(AuthLoginLoading());
    var res = await authRepo.login(
        loginBody: LoginBody(
            password: loginPasswordController.text,
            username: loginEmailController.text));
    res.when(
      data: (data) async {
        await CacheHelper().setInstance(
            data: data.data!.token!, key: AppString.accessTokenKey);
        await CacheHelper().setInstance(data: data.data!.id, key: 'userId');
        await CacheHelper()
            .setInstance(data: data.data!.username!, key: 'userName');
        await CacheHelper()
            .setInstance(data: data.data!.username!, key: 'email');

        emit(AuthLoginSuccess());
      },
      error: (error) {
        emit(AuthLoginError(error: error.apiErrorModel.message!));
      },
    );
  }

  Future<void> signUp() async {
    emit(AuthSignUpLoading());
    var res = await authRepo.signUp(
        signUpBody: SignupPatienBody(
            password: signUppasswordController.text,
            username: signUpNameController.text,
            confirmPassword: signUpconfirmPasswordController.text,
            email: signUpemailController.text));
    res.when(
      data: (data) async {
        await CacheHelper().setInstance(
            data: data.data!.token!, key: AppString.accessTokenKey);
        await CacheHelper().setInstance(data: data.data!.id!, key: 'userId');
        await CacheHelper()
            .setInstance(data: data.data!.username!, key: 'userName');
        await CacheHelper()
            .setInstance(data: data.data!.username!, key: 'email');

        emit(AuthSignUpSuccess());
      },
      error: (error) {
        emit(AuthSignUpError(error: error.apiErrorModel.message!));
      },
    );
  }
}
