import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyUtils {
  static void showAlert(String title, String message) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('확인'),
            onPressed: () {
              Get.back(); // 대화 상자 닫기
            },
          ),
        ],
      ),
    );
  }
}
