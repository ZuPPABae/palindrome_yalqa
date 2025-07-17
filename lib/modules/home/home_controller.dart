import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palindrome_app/app/pages.dart';
import '../../utils/palindrome.dart';

class HomeController extends GetxController {
  final name = ''.obs;
  final sentence = ''.obs;

  void checkPalindrome() {
    if (sentence.value.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a sentence to check.');
      return;
    }

    final result = isPalindrome(sentence.value);
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                result ? Icons.check_circle : Icons.cancel,
                color: result ? Colors.green : Colors.red,
                size: 60,
              ),
              const SizedBox(height: 20),
              Text(
                result ? 'isPalindrome' : 'not palindrome',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: result ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToWelcome() {
    if (name.value.isEmpty) {
      Get.snackbar('Error', 'Please enter your name');
      return;
    }
    Get.toNamed(Pages.welcome, arguments: name.value);
  }
}