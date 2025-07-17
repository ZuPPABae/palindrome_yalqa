import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'users_model.dart'; // Save the model above in a separate file

class UsersController extends GetxController {
  final users = <User>[].obs;
  final isLoading = false.obs;
  final hasMore = true.obs;
  final page = 1.obs;
  final perPage = 10;

  @override
  void onInit() {
    super.onInit();
    fetchUsers(isInitial: true);
  }

  Future<void> fetchUsers({bool isInitial = false}) async {
    if (isInitial) {
      page.value = 1;
      users.clear();
      hasMore.value = true;
    }

    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;

    final url = Uri.parse('https://reqres.in/api/users?page=${page.value}&per_page=$perPage');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List fetchedUsers = data['data'];

      if (fetchedUsers.isEmpty) {
        hasMore.value = false;
      } else {
        users.addAll(fetchedUsers.map<User>((json) => User.fromJson(json as Map<String, dynamic>)).toList());
        page.value += 1;
      }
    }

    isLoading.value = false;
  }
}
