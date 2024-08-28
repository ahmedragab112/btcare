import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/model/add_chat_response.dart';
import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:btcare/features/patient/machine/view/widgets/custom_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return CustomScrollView(
      slivers: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SliverList.separated(
              itemBuilder: (context, index) => CustomChat(
                chatIteam:
                    cubit.getAllChatsResponse?[index] ?? AddChatResponse(),
              ),
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              itemCount: cubit.getAllChatsResponse?.length ?? 0,
            );
          },
        )
      ],
    ).setPadding(context, horizontal: 20, vertical: 20);
  }
}
