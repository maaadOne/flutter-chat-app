import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String senderId,
    required DateTime timestamp,
    required bool isRead,
    @Default('') String text, // По умолчанию пустая строка
    @Default(false) bool isPhoto, // По умолчанию false
    @Default('') String photoUrl, // По умолчанию пустая строка
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
