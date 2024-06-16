import 'package:get/get.dart';
import '../controllers/single_conversation_controller.dart';

class SingleConversationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SingleConversationController());
  }
}
