import 'package:get/get.dart';
import '../modules/conversations/conversations_export.dart';
import '../modules/single_conversation/single_conversation_export.dart';
import 'routes.dart';

class Pages {
  static const String initial = '/conversations';

  static final routes = [
    GetPage(
      name: Routes.conversations,
      page: () => const ConversationsScreen(),
      binding: ConversationsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.singleConversation,
      page: () => const SingleConversationScreen(),
      binding: SingleConversationBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
