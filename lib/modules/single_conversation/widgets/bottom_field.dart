import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/single_conversation_controller.dart';

class BottomField extends GetWidget<SingleConversationController> {
  const BottomField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFEDF2F6),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              controller.sendImage();
            },
            child: Container(
              padding: const EdgeInsets.all(6.0),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFFEDF2F6),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Image.asset('assets/icons/attach.png'),
            ),
          ),
          const SizedBox(width: 6.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEDF2F6),
                border: Border.all(
                  color: const Color(0xFFEDF2F6),
                  width: 0.1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              height: 42,
              child: TextField(
                controller: controller.messageController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Сообщение",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9DB7CB),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                ),
                onSubmitted: (value) {
                  controller.addMessage();
                },
              ),
            ),
          ),
          const SizedBox(width: 6.0),
          Container(
            padding: const EdgeInsets.all(6.0),
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEDF2F6),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Image.asset('assets/icons/audio.png'),
          ),
        ],
      ),
    );
  }
}
