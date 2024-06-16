import 'package:get/get.dart';
import '../../../helpers/faker_generator.dart';
import '../../../models/chat_model/chat_model.dart';
import '../../../models/message_model/message_model.dart';

class ConversationsController extends GetxController {
  final RxList<ChatModel> _chats = <ChatModel>[].obs;

  List<ChatModel> get chats => _chats;

  @override
  void onInit() {
    // Создаем 20 случайных чатов
    _chats.value = generateFakeChats(count: 20);
    super.onInit();
  }

  void addMessageToChat(Message newMessage) {
    final chatIndex = _chats.indexWhere((chat) => chat.id == newMessage.id);
    if (chatIndex != -1) {
      Get.log(_chats[chatIndex].id.toString());
      _chats[chatIndex] = _chats[chatIndex].copyWith(
        messages: List.of(_chats[chatIndex].messages)..insert(0, newMessage),
      );
      update();
    }
  }
}
