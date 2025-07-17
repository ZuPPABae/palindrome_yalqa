import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Second Screen',
          style: TextStyle(
            color: Color(0xFF04021D),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF554AF0)),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Important: keep items starting from the top
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome',
                style: TextStyle(fontSize: 14, color: Color(0xFF04021D))),
            Obx(() => Text(
              controller.userName.value,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF04021D)),
            )),
            const SizedBox(height: 0),

            // Centered Content Section Only
            Expanded(
              child: Center(
                child: Obx(() {
                  final displayText = controller.selectedUser.value.isEmpty ||
                      controller.selectedUser.value == 'No user selected'
                      ? 'Selected User Name'
                      : controller.selectedUser.value;
                  return Text(
                    displayText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF04021D)),
                  );
                }),
              ),
            ),

            // Bottom Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.chooseUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B637B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Choose a User',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
