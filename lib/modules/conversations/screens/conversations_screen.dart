import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_messenger/models/chat_model/chat_model.dart';
import 'package:test_messenger/modules/conversations/controllers/conversations_controller.dart';
import 'package:test_messenger/modules/conversations/widgets/message_widget.dart';

class ConversationsScreen extends GetView<ConversationsController>
    implements PreferredSizeWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          height: 135.0,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFEDF2F6),
                width: 1.0,
              ),
            ),
          ),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Чаты',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFEDF2F6),
                      border: Border.all(
                        color: const Color(0xFFEDF2F6),
                        width: 0.1,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0))),
                  height: 42,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'assets/icons/search.png',
                        width: 24,
                        height: 24,
                      ),
                      hintText: "Поиск",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF9DB7CB),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Чаты
            Obx(() {
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 12,
                  bottom: 0,
                ),
                shrinkWrap: true,
                itemCount: controller.chats.length,
                itemBuilder: (context, index) {
                  ChatModel chat = controller.chats[index];
                  return MessageWidget(
                    chat: chat,
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  color: Color(0xFFEDF2F6),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(375.0);
}
