import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_messenger/modules/single_conversation/widgets/appbar_field.dart';
import 'package:test_messenger/modules/single_conversation/widgets/bottom_field.dart';
import 'package:test_messenger/modules/single_conversation/widgets/chat_bubble.dart';
import '../../../constants/sender_id.dart';
import '../controllers/single_conversation_controller.dart';

class SingleConversationScreen extends GetView<SingleConversationController>
    implements PreferredSizeWidget {
  const SingleConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Obx(
          () {
            return AppBarField(
              name: controller.chat.value.name,
              status: controller.chat.value.status,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                controller: controller.scrollController,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 12,
                  bottom: 0,
                ),
                reverse: true,
                itemCount: controller.chat.value.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.chat.value.messages[index];
                  final isSentByMe = message.senderId == mySenderId;

                  return ChatBubble(
                    key: Key(message.id),
                    message: message.text,
                    isMe: isSentByMe,
                    createdAt: message.timestamp.toString(),
                    isRead: message.isRead,
                    timestamp: message.timestamp,
                    isPhoto: message.isPhoto,
                    photoUrl: message.photoUrl,
                  );
                },
              );
            }),
          ),
          const BottomField(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
