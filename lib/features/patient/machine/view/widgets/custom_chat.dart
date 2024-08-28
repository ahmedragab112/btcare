import 'package:btcare/core/api/web_service.dart';
import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/helper/dio_factory.dart';
import 'package:btcare/core/model/add_chat_response.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/machine/data/repo/machine_repo_implemenation.dart';
import 'package:btcare/features/patient/machine/data/service/api_service.dart';
import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:btcare/features/patient/machine/view/pages/chat_containts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomChat extends StatelessWidget {
  const CustomChat({super.key, required this.chatIteam});
  final AddChatResponse chatIteam;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(BlocProvider(
          create: (context) => HomeCubit(MachineRepoImplementation(
              machineWebService: MachineWebService(DioFactory.getDio()),
              webServices: WebServices(DioFactory.getDio())))
            ..getChatMessges(chatIteam.id!),
          child: ChatContaint(
            chatModel: chatIteam,
          ),
        ));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(
              chatIteam.doctorProfile?.image ?? '',
              width: 70,
              height: 70,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/doctor.png',
                width: 70,
                height: 70,
                fit: BoxFit.fill,
              ),
            ),
            const HorizantelSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatIteam.doctorProfile?.username ?? '',
                  style: const TextStyle(color: Colors.black),
                ),
                const VerticalSpace(10),
                const Text('Hello', style: TextStyle(color: Colors.black))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
