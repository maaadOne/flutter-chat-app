import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_messenger/models/chat_model/chat_model.dart';
import 'package:test_messenger/modules/conversations/controllers/conversations_controller.dart';
import '../../../constants/sender_id.dart';
import '../../../models/message_model/message_model.dart';

class SingleConversationController extends GetxController {
  Rx<ChatModel> chat = const ChatModel(
    id: "",
    name: "",
    imageUrl: "",
    status: false,
    messages: [],
  ).obs;

  TextEditingController? messageController;
  ScrollController? scrollController;
  ConversationsController conversationsController =
      Get.find<ConversationsController>();

  final uploading = false.obs;

  @override
  void onInit() {
    var arguments = Get.arguments as Map<String, dynamic>;
    if (arguments['chat'] != null) {
      chat.value = arguments['chat'] as ChatModel;
    }
    messageController = TextEditingController();
    scrollController = ScrollController();
    super.onInit();
  }

  // Метод для отправки фото
  void sendImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    File imageFile = File(image.path);
    try {
      uploading.value = true;
      final newMessage = Message(
        id: chat.value.id,
        text: "",
        senderId: mySenderId,
        timestamp: DateTime.now(),
        isRead: false,
        isPhoto: true,
        photoUrl: imageFile.path,
      );
      conversationsController.addMessageToChat(newMessage);
      chat.value = chat.value.copyWith(
        messages: List.of(chat.value.messages)..insert(0, newMessage),
      );
      scrollToBottom();
    } catch (e) {
      print(e);
      // TODO: Handle error
    } finally {
      uploading.value = false;
    }
  }

  // Метод для отправки текстового сообщения
  void addMessage() {
    if (messageController!.text.isEmpty) {
      return; // Если сообщение пустое, то выходим
    }
    final newMessage = Message(
      id: chat.value.id,
      text: messageController!.text,
      senderId: mySenderId,
      timestamp: DateTime.now(),
      isRead: false,
      isPhoto: false,
    );
    // Добавляем сообщение в чат
    conversationsController.addMessageToChat(newMessage);
    chat.value = chat.value.copyWith(
      messages: List.of(chat.value.messages)..insert(0, newMessage),
    );
    scrollToBottom();
    // Очищаем поле ввода сообщения
    messageController?.clear();
  }

  void scrollToBottom() {
    // Скролл до нижней границы ListView,
    scrollController?.animateTo(
      scrollController!.position.minScrollExtent,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeIn,
    );
  }

  @override
  void onClose() {
    messageController?.dispose();
    scrollController?.dispose();
    super.onClose();
  }
}
