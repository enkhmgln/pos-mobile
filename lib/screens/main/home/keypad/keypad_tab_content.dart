import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

import '../home_controller.dart';
import 'keypad_grid.dart';

class KeypadTabContent extends StatelessWidget {
  const KeypadTabContent({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
          child: Obx(
            () => Text(
              controller.amountDisplay,
              style: AppTextStyles.displayBold.copyWith(
                color: AppColors.textPrimary,
                fontSize: 56,
              ),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: controller.onAddNote,
              icon: const Icon(
                Icons.add,
                size: 20,
                color: AppColors.textPrimary,
              ),
              label: Text(
                'Тэмдэглэл',
                style: AppTextStyles.bodyLargeBold.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: AppColors.outline.withValues(alpha: 0.4),
                ),
                backgroundColor: AppColors.background,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: KeypadGrid(onTap: controller.onKeypadTap),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
          child: Obx(() {
            final count = controller.itemCount.value;
            return Material(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(28),
              child: InkWell(
                onTap: controller.onReviewSale,
                borderRadius: BorderRadius.circular(28),
                child: SizedBox(
                  height: 56,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Review sale',
                          style: AppTextStyles.titleMediumBold.copyWith(
                            color: AppColors.background,
                          ),
                        ),
                        if (count > 0)
                          Text(
                            '$count item${count == 1 ? '' : 's'}',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.background.withValues(
                                alpha: 0.9,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
