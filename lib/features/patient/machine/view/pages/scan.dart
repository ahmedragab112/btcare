import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/helper/show_dialog.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:btcare/features/patient/machine/view/widgets/build_listener.dart';
import 'package:btcare/features/patient/machine/view/widgets/build_xray.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: .2,
            child: Image.asset(
              'assets/images/lancher_icon.png',
              width: double.infinity,
              height: 450,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalSpace(135),
              const Text(
                'X-ray Examination',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff03A1A4),
                ),
              ),
              const VerticalSpace(82),
              Opacity(
                opacity: .7,
                child: BuildXray(
                  onTap: () {
                    testDialog(context);
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  context.read<HomeCubit>().uploadImage();
                },
                child: Card(
                  child: Container(
                    width: 200,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff03A1A4),
                    ),
                    child: const Text(
                      'Examine',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is MachineSuccess) {
                    return Text(
                        "the result of MRI image is :${state.data.result ?? ''}");
                  } else {
                    return const Text("please upload image");
                  }
                },
              ),
              const BuildListener()
            ],
          ),
        ],
      ).setPadding(context, vertical: 72, horizontal: 24),
    );
  }
}
