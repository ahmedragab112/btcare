import 'package:btcare/features/machine/manager/machine_cubit.dart';
import 'package:btcare/features/machine/view/widgets/build_image.dart';
import 'package:btcare/features/machine/view/widgets/build_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<MachineCubit>(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildImage(
              onTap: () {
                dialog(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<MachineCubit>().uploadImage();
              },
              child: const Text('Upload Image'),
            ),
            BlocBuilder<MachineCubit, MachineState>(
              builder: (context, state) {
                if (state is MachineSuccess) {
                  return Text(bloc.result!);
                } else {
                  return const Text(" please upload image ");
                }
              },
            ),
            const BuildListener()
          ],
        ),
      ),
    );
  }

  void dialog(BuildContext context) {
    showAboutDialog(
      context: context,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                  const Text('Camera'),
                ],
              ),
              const SizedBox(width: 100),
              Column(
                children: [
                  IconButton(
                    onPressed: () async {
                      await context.read<MachineCubit>().pickGalleryImage();
                    },
                    icon: const Icon(
                      Icons.image,
                      color: Colors.blue,
                    ),
                  ),
                  const Text('Gallery'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
