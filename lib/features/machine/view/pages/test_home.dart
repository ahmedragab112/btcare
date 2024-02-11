import 'package:btcare/core/helper/show_dialog.dart';
import 'package:btcare/features/machine/manager/machine_cubit.dart';
import 'package:btcare/features/machine/view/widgets/build_image.dart';
import 'package:btcare/features/machine/view/widgets/build_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BTCARE',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/background.svg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildImage(
                  onTap: () {
                    testDialog(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side:
                              const BorderSide(color: Colors.blue, width: 2))),
                  onPressed: () {
                    context.read<MachineCubit>().uploadImage();
                  },
                  child: const Text('Upload Image'),
                ),
                BlocBuilder<MachineCubit, MachineState>(
                  builder: (context, state) {
                    if (state is MachineSuccess) {
                      return Text("the result of MRI image is :${state.data.result ?? ''}");
                    } else {
                      return const Text("please upload image");
                    }
                  },
                ),
                const BuildListener()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
