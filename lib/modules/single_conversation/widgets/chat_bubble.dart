import 'dart:io';
import 'package:flutter/material.dart';
import '../../../helpers/utils.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String createdAt;
  final bool isRead;
  final DateTime timestamp;
  final bool isPhoto;
  final String? photoUrl;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isMe,
    required this.createdAt,
    required this.isRead,
    required this.timestamp,
    required this.isPhoto,
    this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String timeFormatted = formatTime(timestamp);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        const SizedBox(width: 5),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: isMe ? const Color(0xFF3CED78) : const Color(0xFFEDF2F6),
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(23),
                      topRight: Radius.circular(23),
                      bottomLeft: Radius.circular(23),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(23),
                      topRight: Radius.circular(23),
                      bottomRight: Radius.circular(23),
                    ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isPhoto && photoUrl != null)
                  FractionallySizedBox(
                    widthFactor: 5 / 6,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(19),
                        topRight: Radius.circular(19),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: photoUrl!.startsWith('/')
                          ? FadeInImage(
                              image: FileImage(
                                File(photoUrl!),
                              ),
                              placeholder:
                                  const AssetImage('assets/images/loading.gif'),
                            )
                          : FadeInImage(
                              placeholder:
                                  const AssetImage('assets/images/loading.gif'),
                              image: AssetImage(photoUrl!),
                              fit: BoxFit.cover,
                            ),
                    ),
                  )
                else
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isMe
                          ? const Color(0xFF00521C)
                          : const Color(0xFF2B333E),
                    ),
                  ),
                const SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      timeFormatted,
                      style: TextStyle(
                        color: isMe
                            ? const Color(0xFF00521C)
                            : const Color(0xFF2B333E),
                        fontSize: 12,
                      ),
                    ),
                    if (isMe)
                      const SizedBox(width: 5), // для отступа между сообщениями
                    if (isMe)
                      Icon(
                        isRead ? Icons.done_all : Icons.done,
                        color: const Color(0xFF00521C),
                        size: 12,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
