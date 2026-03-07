import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/components/button/_.dart';

enum AppAlertType {
  success(title: 'Амжилттай', icon: Icons.check_circle_rounded),
  error(title: 'Алдаа', icon: Icons.error_rounded),
  warning(title: 'Анхааруулга', icon: Icons.warning_rounded);

  const AppAlertType({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

class AppAlert extends StatelessWidget {
  const AppAlert({
    super.key,
    required this.type,
    required this.bodyText,
    this.titleText,
    this.acceptText,
    this.cancelText,
    this.dismissable = true,
  });

  final AppAlertType type;
  final String bodyText;
  final String? titleText;
  final String? acceptText;
  final String? cancelText;
  final bool dismissable;

  Future<bool?> show() {
    return Get.dialog<bool>(this, barrierDismissible: dismissable);
  }

  Color get _iconColor => switch (type) {
        AppAlertType.success => AppColors.success,
        AppAlertType.error => AppColors.error,
        AppAlertType.warning => AppColors.warning,
      };

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      elevation: 0,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.textPrimary.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: AppColors.textPrimary.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 32, 28, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _AlertIconSection(color: _iconColor, icon: type.icon),
                const SizedBox(height: 24),
                Text(
                  titleText ?? type.title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleLargeBold.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  bodyText,
                  textAlign: TextAlign.center,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                ),
                if (acceptText != null || cancelText != null) ...[
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      if (cancelText != null) ...[
                        Expanded(
                          child: AppButtonWidget(
                            model: AppButtonModel(
                              label: cancelText!,
                              type: AppButtonType.outline,
                              size: AppButtonSize.medium,
                            ),
                            onPressed: () => Get.back(result: false),
                          ),
                        ),
                        if (acceptText != null) const SizedBox(width: 12),
                      ],
                      if (acceptText != null)
                        Expanded(
                          child: AppButtonWidget(
                            model: AppButtonModel(
                              label: acceptText!,
                              type: AppButtonType.primary,
                              size: AppButtonSize.medium,
                            ),
                            onPressed: () => Get.back(result: true),
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AlertIconSection extends StatelessWidget {
  const _AlertIconSection({required this.color, required this.icon});

  final Color color;
  final IconData icon;

  static const double _size = 88;
  static const double _iconSize = 44;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer glow
          Container(
            width: _size,
            height: _size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.06),
            ),
          ),
          // Ring
          Container(
            width: _size - 8,
            height: _size - 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: color.withValues(alpha: 0.2),
                width: 2,
              ),
              color: color.withValues(alpha: 0.1),
            ),
          ),
          // Inner circle + icon
          Container(
            width: _size - 24,
            height: _size - 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.14),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, size: _iconSize, color: color),
          ),
        ],
      ),
    );
  }
}
