import 'package:btcare/core/helper/dio_factory.dart';
import 'package:btcare/features/machine/data/repo/machine_repo_implemenation.dart';
import 'package:btcare/features/machine/data/service/api_service.dart';
import 'package:btcare/features/machine/manager/machine_cubit.dart';
import 'package:btcare/features/machine/view/pages/test_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BtCare extends StatelessWidget {
  const BtCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MachineCubit(
          MachineRepoImplementation(
            MachineWebService(
              DioFactory.getDio(),
            ),
          ),
        ),
        child: const TestHome(),
      ),
    );
  }
}
