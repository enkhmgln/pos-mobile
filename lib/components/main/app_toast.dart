import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';

abstract class AppToast {
  AppToast._();

  static void show(
    String message, {
    String? title,
    bool isError = false,
    SnackPosition position = SnackPosition.TOP,
    Duration duration = const Duration(seconds: 3),
  }) {
    final backgroundColor = isError ? AppColors.error : AppColors.primary;
    final colorText = isError ? AppColors.onError : AppColors.onPrimary;
    Get.snackbar(
      title ?? '',
      message,
      snackPosition: position,
      backgroundColor: backgroundColor,
      colorText: colorText,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: duration,
      titleText: title != null && title.isNotEmpty
          ? Text(
              title,
              style: TextStyle(
                color: colorText,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            )
          : const SizedBox.shrink(),
      messageText: Text(
        message,
        style: TextStyle(color: colorText, fontSize: 13),
      ),
    );
  }

  static void showError(String message, {String? title}) {
    show(message, title: title ?? 'Error', isError: true);
  }

  static void showSuccess(String message, {String? title}) {
    show(message, title: title ?? 'Success', isError: false);
  }
}
