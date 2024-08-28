import 'package:btcare/core/model/add_chat_response.dart';
import 'package:btcare/core/model/message_body.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:flutter/material.dart';

class SendMessageTextFiled extends StatelessWidget {
  const SendMessageTextFiled(
      {super.key, required this.cuibit, required this.chatModel});
  final HomeCubit cuibit;
  final AddChatResponse chatModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: cuibit.messageController,
            style: TextStyle(
                fontSize: 14, color: const Color(0xff03A1A4).withOpacity(.70)),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff03A1A4),
                ),
              ),
              hintText: 'Type your message here',
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        const HorizantelSpace(20),
        IconButton(
          onPressed: () async {
            await cuibit.sendMessage(
                messageBody:
                    MessageBody(content: cuibit.messageController.text),
                chatId: chatModel.id!);
          },
          icon: cuibit.messageController.text.isEmpty
              ? const Icon(Icons.send)
              : const Icon(Icons.mic),
        )
      ],
    );
  }
}
