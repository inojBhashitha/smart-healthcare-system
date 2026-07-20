import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../providers/prescription_provider.dart';

class NextDoseCard extends StatefulWidget {
  const NextDoseCard({super.key});

  @override
  State<NextDoseCard> createState() => _NextDoseCardState();
}

class _NextDoseCardState extends State<NextDoseCard> {
  bool _isTaken = false;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PrescriptionProvider>();
    final details = provider.prescriptionDetails;
    final hasMedicine = details != null && details.medicines.isNotEmpty;

    final String medName = hasMedicine
        ? details.medicines.first.medicineName
        : "Panadol (Paracetamol)";
    final String dosage = hasMedicine
        ? (details.medicines.first.strength.isNotEmpty
            ? details.medicines.first.strength
            : "500mg")
        : "500mg • 2 Tablets";
    final String instructions = hasMedicine
        ? (details.medicines.first.instruction.isNotEmpty
            ? details.medicines.first.instruction
            : "After Meals")
        : "After Meals";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.card.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(AppRadius.large),
        border: Border.all(
          color: _isTaken
              ? AppColors.success.withValues(alpha: 0.2)
              : Colors.white.withValues(alpha: 0.05),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: _isTaken
                ? AppColors.success.withValues(alpha: 0.05)
                : Colors.black.withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _isTaken
                  ? AppColors.success.withValues(alpha: 0.12)
                  : AppColors.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isTaken ? Icons.check_circle_rounded : Icons.alarm_rounded,
              color: _isTaken ? AppColors.success : AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _isTaken
                  ? [
                      const Text(
                        "Dose Completed!",
                        style: TextStyle(
                          color: AppColors.success,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "You took $medName",
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ]
                  : [
                      Row(
                        children: [
                          const Text(
                            "Next Scheduled Dose",
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.warning.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              "In 2 hours",
                              style: TextStyle(
                                color: AppColors.warning,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        medName,
                        style: AppTextStyles.title.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            dosage,
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "•",
                            style: TextStyle(color: AppColors.textDisabled),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              instructions,
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          _isTaken
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isTaken = false;
                    });
                  },
                  icon: const Icon(
                    Icons.undo_rounded,
                    color: AppColors.textSecondary,
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isTaken = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Dose for $medName recorded!"),
                        backgroundColor: AppColors.success,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success.withValues(alpha: 0.15),
                    foregroundColor: AppColors.success,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.medium),
                      side: const BorderSide(
                        color: AppColors.success,
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Take",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
