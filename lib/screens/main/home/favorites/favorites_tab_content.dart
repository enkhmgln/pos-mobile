import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';

class FavoritesTabContent extends StatelessWidget {
  const FavoritesTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Center(
        child: Text(
          'Favorites',
          style: AppTextStyles.titleLargeBold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
