import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

class KeypadGrid extends StatelessWidget {
  const KeypadGrid({super.key, required this.onTap});

  final ValueChanged<String> onTap;

  static const _keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['C', '0', '+'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _keys.asMap().entries.map((rowEntry) {
        final row = rowEntry.value;
        return Row(
          children: row.asMap().entries.map((cellEntry) {
            final key = cellEntry.value;
            final isPlus = key == '+';
            return Expanded(
              child: Material(
                color: AppColors.background,
                child: InkWell(
                  onTap: () => onTap(key),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.outline.withValues(alpha: 0.1),
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      key,
                      style: AppTextStyles.heading2Bold.copyWith(
                        color: isPlus
                            ? AppColors.textSecondary
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
