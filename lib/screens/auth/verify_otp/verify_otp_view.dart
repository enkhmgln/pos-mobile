import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/theme/app_colors.dart';
import '/app/theme/app_text_styles.dart';
import '/components/_.dart';

import 'verify_otp_controller.dart';

class VerifyOtpView extends GetView<VerifyOtpController> {
  const VerifyOtpView({super.key});

  static const String routeName = '/verify-otp';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Баталгаажуулах код',
                    style: AppTextStyles.heading1Bold.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Таны ${controller.email} и-мэйл хаяг руу илгээсэн 4 оронтой кодыг оруулна уу.',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: AppOtpWidget(model: controller.otpModel)),
                    const SizedBox(height: 32),
                    Obx(
                      () => AppButtonWidget(
                        model: AppButtonModel(
                          label: 'Баталгаажуулах',
                          type: AppButtonType.primary,
                          size: AppButtonSize.large,
                          isLoading: controller.isLoading.value,
                        ),
                        onPressed: controller.onSubmit,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
