import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_messenger/models/chat_model/chat_model.dart';
import '../../../constants/sender_id.dart';
import '../../../helpers/utils.dart';
import '../../../routes/routes.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({super.key, required this.chat});

  final ChatModel chat;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.singleConversation,
          arguments: {'chat': widget.chat},
        );
      },
      child: Container(
        color: Colors.white,
        // height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: generateRandomColor(),
              child: Center(
                child: Text(
                  '${widget.chat.name.characters.first.toUpperCase()} ${widget.chat.name.characters.last.toUpperCase()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.chat.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.chat.messages.first.text.isEmpty
                            ? widget.chat.messages.first.senderId == mySenderId
                                ? 'Отправлено фото'
                                : 'Отправил(а) фото'
                            : widget.chat.messages.first.text,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              formatTimestamp(widget.chat.messages.last.timestamp.toString()),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
