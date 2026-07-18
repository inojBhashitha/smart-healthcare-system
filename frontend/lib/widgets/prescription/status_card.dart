import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

class StatusCard extends StatelessWidget {
  final String status;
  final int medicinesFound;
  final String uploadedAt;

  const StatusCard({
    super.key,
    required this.status,
    required this.medicinesFound,
    required this.uploadedAt,
  });

  Color get statusColor {
    switch (status) {
      case "OCR_COMPLETED":
        return AppColors.success;
      case "PROCESSING":
        return AppColors.warning;
      case "FAILED":
        return AppColors.danger;
      default:
        return AppColors.primary;
    }
  }

  String get statusText {
    switch (status) {
      case "OCR_COMPLETED":
        return "Scan Verified";
      case "PROCESSING":
        return "Processing";
      case "FAILED":
        return "Scan Failed";
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sColor = statusColor;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.card.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(AppRadius.large),
        border: Border.all(
          color: sColor.withValues(alpha: 0.15),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: sColor.withValues(alpha: 0.02),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: sColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  status == "OCR_COMPLETED"
                      ? Icons.verified_user_rounded
                      : (status == "FAILED"
                          ? Icons.error_outline_rounded
                          : Icons.pending_actions_rounded),
                  color: sColor,
                  size: 22,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      statusText,
                      style: AppTextStyles.title.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Current pipeline status",
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          const Divider(color: Color(0xFF1E293B)),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Medicines Recognized",
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                medicinesFound.toString(),
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upload Timestamp",
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Flexible(
                child: Text(
                  uploadedAt,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: Alignment.centerRight.x > 0 ? TextAlign.end : TextAlign.start,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}