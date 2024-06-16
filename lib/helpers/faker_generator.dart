import 'package:faker/faker.dart';
import 'package:test_messenger/models/chat_model/chat_model.dart';
import '../constants/russian_txt_faker.dart';
import '../constants/sender_id.dart';
import '../models/message_model/message_model.dart';
import 'dart:math';

// Функция для генерации случайных сообщений
List<Message> generateFakeMessages({int count = 25}) {
  final faker = Faker();
  final List<Message> messages = [];
  final random = Random();

  for (int i = 0; i < count; i++) {
    final isMyMessage = faker.randomGenerator
        .boolean(); // Случайный выбор, является ли сообщение от меня
    final senderId = isMyMessage ? mySenderId : faker.guid.guid();
    final isPhoto = faker.randomGenerator
        .boolean(); // Случайный выбор, является ли это фото
    final messageText = isPhoto
        ? ''
        : russianSentences[random.nextInt(russianSentences.length)];
    final photoUrl =
        isPhoto ? imageFiles[random.nextInt(imageFiles.length)] : '';

    final message = Message(
      id: faker.guid.guid(),
      text: messageText,
      senderId: senderId,
      timestamp: faker.date.dateTime(minYear: 2024, maxYear: 2024),
      isRead: false,
      isPhoto: isPhoto,
      photoUrl: photoUrl,
    );

    messages.add(message);
  }

  // Установка флага "Прочитано" для сообщений от меня
  for (int i = 0; i < messages.length; i++) {
    if (messages[i].senderId == mySenderId) {
      for (int j = i + 1; j < messages.length; j++) {
        if (messages[j].senderId != mySenderId) {
          messages[i] = messages[i].copyWith(isRead: true);
          break;
        }
      }
    }
  }

  return messages;
}

// Генерация чатов
List<ChatModel> generateFakeChats({int count = 10}) {
  final faker = Faker();
  List<ChatModel> chats = List<ChatModel>.empty(growable: true);
  final random = Random();

  for (int i = 0; i < count; i++) {
    final List<Message> messages =
        generateFakeMessages(count: faker.randomGenerator.integer(25, min: 1));

    final chat = ChatModel(
      id: faker.guid.guid(),
      name: russianNames[random.nextInt(russianNames.length)],
      imageUrl: faker.image.image(),
      status: faker.randomGenerator.boolean(),
      messages: messages,
    );

    chats.add(chat);
  }

  return chats;
}
