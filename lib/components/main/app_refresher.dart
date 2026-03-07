import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '/app/theme/app_colors.dart';

class AppRefresher extends StatelessWidget {
  const AppRefresher({
    super.key,
    required this.controller,
    required this.child,
    this.onRefresh,
    this.onLoading,
    this.enablePullDown = true,
    this.enablePullUp = false,
  });

  final RefreshController controller;
  final Widget child;

  final Future<void> Function()? onRefresh;

  final Future<void> Function()? onLoading;
  final bool enablePullDown;
  final bool enablePullUp;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      onRefresh: onRefresh,
      onLoading: onLoading,
      header: MaterialClassicHeader(
        color: AppColors.primary,
        backgroundColor: AppColors.background,
      ),
      footer: CustomFooter(
        builder: (footerContext, mode) {
          if (mode == LoadStatus.loading) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                  child: SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      child: child,
    );
  }
}
