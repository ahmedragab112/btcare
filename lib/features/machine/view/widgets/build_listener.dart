import 'package:btcare/features/machine/manager/machine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildListener extends StatelessWidget {
  const BuildListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MachineCubit, MachineState>(
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
          showDialog(
            context: context,
            builder: (context) => Center(child: Text(state.error)),
          );
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
