import 'package:btcare/config/router/routes.dart';
import 'package:btcare/core/api/web_service.dart';
import 'package:btcare/core/helper/dio_factory.dart';
import 'package:btcare/features/doctor/data/auth_repo_implementation.dart';
import 'package:btcare/features/doctor/manager/doctor_auth_cubit.dart';
import 'package:btcare/features/doctor/view/screens/login_doctor.dart';
import 'package:btcare/features/doctor/view/screens/signup_doctor.dart';
import 'package:btcare/features/gest/machine.dart';
import 'package:btcare/features/onboarding/onboarding_page.dart';
import 'package:btcare/features/patient/auth/data/auth_repo_implementation.dart';
import 'package:btcare/features/patient/auth/manager/auth_cubit.dart';
import 'package:btcare/features/onboarding/chose_login.dart';
import 'package:btcare/features/patient/auth/view/screens/login.dart';
import 'package:btcare/features/patient/auth/view/screens/sign_up.dart';
import 'package:btcare/features/patient/machine/data/repo/machine_repo_implemenation.dart';
import 'package:btcare/features/patient/machine/data/service/api_service.dart';
import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:btcare/features/patient/machine/view/pages/homelayout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<Widget> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(MachineRepoImplementation(
                machineWebService: MachineWebService(DioFactory.getDio()),
                webServices: WebServices(DioFactory.getDio())))
              ..getAllDoctors()
              ..getAllChats(),
            child: const HomeLayout(),
          ),
        );
      case AppRoutes.choseLoginWay:
        return MaterialPageRoute(
          builder: (context) => const ChoseLoginWay(),
        );
      case AppRoutes.loginPatient:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpPatientCubit(
                authRepo: AuthRepoImplementation(
                    webServices: WebServices(DioFactory.getDio()))),
            child: const Login(),
          ),
        );
      case AppRoutes.gestView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(MachineRepoImplementation(
                machineWebService: MachineWebService(DioFactory.getDio()),
                webServices: WebServices(DioFactory.getDio()))),
            child: const GestView(),
          ),
        );

      case AppRoutes.signUpPatient:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpPatientCubit(
                authRepo: AuthRepoImplementation(
                    webServices: WebServices(DioFactory.getDio()))),
            child: const SignUpPatient(),
          ),
        );
      case AppRoutes.signUpDoctor:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DoctorAuthCubit(
                repo: DoctorAuthRepoImplementation(
                    webServices: WebServices(DioFactory.getDio()))),
            child: const SignUpDoctor(),
          ),
        );

      case AppRoutes.loginDoctor:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DoctorAuthCubit(
                repo: DoctorAuthRepoImplementation(
                    webServices: WebServices(DioFactory.getDio()))),
            child: const LoginDoctor(),
          ),
        );

      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No Page Found'),
            ),
          ),
        );
    }
  }
}
