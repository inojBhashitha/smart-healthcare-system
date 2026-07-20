import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../providers/prescription_provider.dart';
import '../../../widgets/prescription/status_card.dart';
import '../../../widgets/prescription/ocr_text_card.dart';
import '../../../widgets/prescription/medicine_card.dart';

class PrescriptionDetailsScreen extends StatelessWidget {
  const PrescriptionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PrescriptionProvider>();
    final prescription = provider.prescriptionDetails;

    if (prescription == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Analysis Results",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.5,
          ),
        ),
        backgroundColor: const Color(0xFF070B19).withValues(alpha: 0.95),
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.05),
              width: 1.2,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 14),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Diagnostic Report",
              style: AppTextStyles.title.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            StatusCard(
              status: prescription.status,
              medicinesFound: prescription.medicinesFound,
              uploadedAt: prescription.uploadedAt,
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              "Recognized Medications",
              style: AppTextStyles.title.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            if (prescription.medicines.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                child: Center(
                  child: Text(
                    "No medicines recognized from the scan.",
                    style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                  ),
                ),
              )
            else
              ...prescription.medicines.map(
                (medicine) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: MedicineCard(
                    medicine: medicine,
                    onToggleVerify: () async {
                      await provider.verifyMedicine(
                        medicine.id,
                        !medicine.verified,
                      );
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              medicine.verified
                                  ? "${medicine.medicineName} marked as pending."
                                  : "${medicine.medicineName} verified successfully!",
                            ),
                            backgroundColor: AppColors.success,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              "Diagnostic Raw Text",
              style: AppTextStyles.title.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            OcrTextCard(
              text: prescription.extractedText,
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}