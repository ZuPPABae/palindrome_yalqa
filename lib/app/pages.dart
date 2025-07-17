import 'package:get/get.dart';
import '../modules/home/home_view.dart';
import '../modules/users/users_view.dart';
import '../modules/welcome/welcome_view.dart';

abstract class Pages {
  static const home = '/';
  static const welcome = '/welcome';
  static const users = '/users';

  static final routes = [
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: welcome, page: () => const WelcomeView()),
    GetPage(name: users, page: () => const UsersView()),
  ];
}