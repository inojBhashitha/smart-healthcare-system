import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class UploadDropZone extends StatelessWidget {
  final VoidCallback onTap;

  const UploadDropZone({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.large),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppRadius.large),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: .4),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.cloud_upload_rounded,
              size: 70,
              color: AppColors.primary,
            ),

            const SizedBox(height: AppSpacing.lg),

            Text(
              "Upload Prescription",
              style: AppTextStyles.title,
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              "Tap to choose an image from\nCamera or Gallery",
              textAlign: TextAlign.center,
              style: AppTextStyles.caption,
            ),

            const SizedBox(height: AppSpacing.lg),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: .12),

                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "PNG • JPG • JPEG",
              ),
            ),
          ],
        ),
      ),
    );
  }
}