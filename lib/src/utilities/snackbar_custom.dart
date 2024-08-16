import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({required String message, bool isError = true}) {
  Get.snackbar(
    "AUTH",
    message,
    backgroundColor: isError ? Colors.red : Colors.green,
    colorText: Colors.white,
  );
}
