import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String formatTimestamp(String timestampString) {
  DateTime timestamp = DateTime.parse(timestampString);
  DateTime now = DateTime.now();

  // разница в часах
  Duration difference = now.difference(timestamp);
  int differenceInHours = difference.inHours;

  if (differenceInHours < 24 && differenceInHours >= 1) {
    return 'Yesterday';
  } else {
    // форматирование даты
    return DateFormat.yMMMd().format(timestamp);
  }
}

// форматирование времени
String formatTime(DateTime timestamp) {
  return "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}";
}

// генерация случайного цвета
Color generateRandomColor() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
}
