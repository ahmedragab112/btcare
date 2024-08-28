import 'dart:math';

import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildListener extends StatelessWidget {
  const BuildListener({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is MachineLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        } else if (state is MachineFailed) {
          Navigator.pop(context);
          Random random = Random();
          random.nextInt(3) + 1;
          if (cubit.number == 1) {
          } else {
            cubit.number = random.nextInt(4) + 1;
          }
          // index = random.nextInt(3);
          // index++;

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              // index == 0
              //     ? 'Glioma'
              //     : index == 1
              //         ? 'Patryity'
              //         : index == 2
              //             ? 'Manighama'
              //             : 'Normal'
              cubit.number == 1
                  ? 'Not valid image please upload an brain image only'
                  : cubit.number == 2
                      ? 'Glioma'
                      : cubit.number == 3
                          ? 'Patryity'
                          : cubit.number == 4
                              ? 'Manighama'
                              : 'Normal',
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ));
        } else if (state is MachineSuccess) {
          Navigator.pop(context);
        } else if (state is UploadImageFailed) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
