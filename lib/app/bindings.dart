import 'package:get/get.dart';
import '../modules/home/home_controller.dart';
import '../modules/users/users_controller.dart';
import '../modules/welcome/welcome_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => WelcomeController(), fenix: true);
    Get.lazyPut(() => UsersController(), fenix: true);
  }
}