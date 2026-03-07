import 'package:flutter/material.dart';

import '/app/theme/app_colors.dart';

class AppCardBorder extends StatelessWidget {
  const AppCardBorder({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
    this.width,
    this.height,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColors.surface;
    final border = borderColor ?? AppColors.outline.withValues(alpha: 0.5);
    final radius = borderRadius ?? BorderRadius.circular(12);

    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: radius,
        border: Border.all(color: border, width: 1),
      ),
      child: ClipRRect(borderRadius: radius, child: child),
    );
  }
}
