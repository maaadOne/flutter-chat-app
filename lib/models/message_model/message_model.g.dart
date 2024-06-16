// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool,
      text: json['text'] as String? ?? '',
      isPhoto: json['isPhoto'] as bool? ?? false,
      photoUrl: json['photoUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'timestamp': instance.timestamp.toIso8601String(),
      'isRead': instance.isRead,
      'text': instance.text,
      'isPhoto': instance.isPhoto,
      'photoUrl': instance.photoUrl,
    };
