import 'package:btcare/config/router/routes.dart';
import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/features/doctor/manager/doctor_auth_cubit.dart';
import 'package:btcare/features/doctor/manager/doctor_auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLisner extends StatelessWidget {
  const CustomLisner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoctorAuthCubit, DoctorAuthState>(
      listener: (context, state) {
        if (state is AuthLoginLoading || state is AuthSignupLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AuthLoginError) {
          Navigator.pop(context);
          context.showSnackBar(state.error);
        } else if (state is AuthSignupError) {
          Navigator.pop(context);
          context.showSnackBar(state.error);
        } else if (state is AuthLoginSuccess || state is AuthSignUpSuccess) {
          Navigator.pop(context);
          context.pushNamedAndRemoveUntil(AppRoutes.home);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
