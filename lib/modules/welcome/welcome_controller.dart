import 'package:get/get.dart';
import 'package:palindrome_app/app/pages.dart';

class WelcomeController extends GetxController {
  final userName = ''.obs;
  final selectedUser = 'No user selected'.obs;

  @override
  void onInit() {
    userName.value = Get.arguments ?? '';
    super.onInit();
  }

  void chooseUser() async {
    final result = await Get.toNamed(Pages.users);
    if (result != null) {
      selectedUser.value = result;
    }
  }
}