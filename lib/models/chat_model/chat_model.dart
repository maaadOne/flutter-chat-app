import 'package:freezed_annotation/freezed_annotation.dart';
import '../message_model/message_model.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
abstract class ChatModel with _$ChatModel {
  const factory ChatModel({
    required String id,
    required String name,
    required String imageUrl,
    required bool status,
    required List<Message> messages,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
