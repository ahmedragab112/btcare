import 'dart:developer';

import 'package:btcare/core/api/web_service.dart';
import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/helper/dio_factory.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/machine/data/repo/machine_repo_implemenation.dart';
import 'package:btcare/features/patient/machine/data/service/api_service.dart';
import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:btcare/features/patient/machine/view/pages/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/get_allprofiles_response.dart';

class BuildDoctorIcon extends StatelessWidget {
  const BuildDoctorIcon({super.key, required this.data});

  final GetAllProfileResponse data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log(data.userId.toString());
        context.push(BlocProvider(
          create: (context) => HomeCubit(MachineRepoImplementation(
              machineWebService: MachineWebService(DioFactory.getDio()),
              webServices: WebServices(DioFactory.getDio())))..getDoctorDetails(data.userId!),
          child: DoctorDetails(),
        ));
      },
      child: Column(
        children: [
          Card(
            elevation: 0.0,
            child: Image.network(
              'https://6647-154-178-242-152.ngrok-free.app${data.image}',
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/doctor.png',
                  width: 70,
                  height: 70,
                  fit: BoxFit.fill,
                );
              },
              width: 70,
              height: 70,
              fit: BoxFit.fill,
            ),
          ),
          const VerticalSpace(10),
          Text(
            data.username ?? '',
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xff393939),
            ),
          )
        ],
      ),
    );
  }
}
