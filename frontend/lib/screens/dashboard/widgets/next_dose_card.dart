import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/reminder/reminder_model.dart';
import '../../../providers/prescription_provider.dart';
import '../../../providers/reminder_provider.dart';

class NextDoseCard extends StatefulWidget {
  const NextDoseCard({super.key});

  @override
  State<NextDoseCard> createState() => _NextDoseCardState();
}

class _NextDoseCardState extends State<NextDoseCard> {
  @override
  Widget build(BuildContext context) {
    final reminderProvider = context.watch<ReminderProvider>();
    final prescriptionProvider = context.watch<PrescriptionProvider>();
    final details = prescriptionProvider.prescriptionDetails;

    final nextReminder = reminderProvider.nextReminder;
    final hasMedicine = details != null && details.medicines.isNotEmpty;

    final String medName = nextReminder?.medicineName ??
        (hasMedicine ? details.medicines.first.medicineName : "Panadol (Paracetamol)");
    final String dosage = nextReminder?.dosage ??
        (hasMedicine
            ? (details.medicines.first.strength.isNotEmpty ? details.medicines.first.strength : "500mg")
            : "500mg • 2 Tablets");
    final String instructions = nextReminder?.instructions ??
        (hasMedicine
            ? (details.medicines.first.instruction.isNotEmpty ? details.medicines.first.instruction : "After Meals")
            : "After Meals");
    final String timeStr = nextReminder?.time ?? "8:00 PM";
    final bool isTaken = nextReminder?.isTaken ?? false;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.card.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(AppRadius.large),
        border: Border.all(
          color: isTaken
              ? AppColors.success.withValues(alpha: 0.2)
              : Colors.white.withValues(alpha: 0.05),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isTaken
                ? AppColors.success.withValues(alpha: 0.05)
                : Colors.black.withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null && context.mounted) {
                final formatted = picked.format(context);
                reminderProvider.addReminder(
                  ReminderModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    medicineName: medName,
                    dosage: dosage,
                    time: formatted,
                    instructions: instructions,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Alarm scheduled for $medName at $formatted!"),
                    backgroundColor: AppColors.primary,
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isTaken
                    ? AppColors.success.withValues(alpha: 0.12)
                    : AppColors.primary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isTaken ? Icons.check_circle_rounded : Icons.alarm_add_rounded,
                color: isTaken ? AppColors.success : AppColors.primary,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: isTaken
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
                        "You took $medName at $timeStr",
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
                            child: Text(
                              timeStr,
                              style: const TextStyle(
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
          isTaken
              ? IconButton(
                  onPressed: () {
                    if (nextReminder != null) {
                      reminderProvider.toggleTaken(nextReminder.id);
                    }
                  },
                  icon: const Icon(
                    Icons.undo_rounded,
                    color: AppColors.textSecondary,
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    if (nextReminder != null) {
                      reminderProvider.toggleTaken(nextReminder.id);
                    }
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
