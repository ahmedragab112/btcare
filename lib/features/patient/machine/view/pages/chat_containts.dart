import 'package:btcare/core/cache/cache_helper.dart';
import 'package:btcare/core/model/add_chat_response.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:btcare/features/patient/machine/view/widgets/messges_widget.dart';
import 'package:btcare/features/patient/machine/view/widgets/send_message_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';

class ChatContaint extends StatelessWidget {
  const ChatContaint({super.key, required this.chatModel});
  final AddChatResponse chatModel;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(chatModel.doctorProfile?.username ?? ''),
        actions: [
          Image.network(
            chatModel.doctorProfile?.image ?? '',
            errorBuilder: (context, error, stackTrace) =>
                Image.asset('assets/images/doctor.png'),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/loginbrain.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => MessageWidget(
                              text: cubit.messages?[index].content ?? '',
                              type: CacheHelper().getInt('userId') ==
                                      cubit.messages?[index].sender
                                  ? BubbleType.sendBubble
                                  : BubbleType.receiverBubble,
                            ),
                        separatorBuilder: (context, index) =>
                            const VerticalSpace(10),
                        itemCount: cubit.messages?.length ?? 0),
                  );
                },
              ),
              const VerticalSpace(20),
              SendMessageTextFiled(
                cuibit: cubit,
                chatModel: chatModel
              )
            ],
          )
        ],
      ),
    );
  }
}
