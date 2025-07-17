import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'users_controller.dart';
import 'users_model.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Third Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF554AF0)),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.users.isEmpty && controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.users.isEmpty) {
          return const Center(child: Text("No users found."));
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchUsers(isInitial: true),
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!controller.isLoading.value &&
                  controller.hasMore.value &&
                  scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                controller.fetchUsers();
              }
              return false;
            },
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: controller.users.length + (controller.hasMore.value ? 1 : 0),
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                if (index >= controller.users.length) {
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final User user = controller.users[index];
                final userName = '${user.firstName} ${user.lastName}';

                return ListTile(
                  onTap: () => Get.back(result: userName),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text(
                    userName,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(user.email),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
