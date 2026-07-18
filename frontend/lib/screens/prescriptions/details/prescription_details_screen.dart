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
        title: const Text("Analysis Results"),
        elevation: 0,
        backgroundColor: Colors.transparent,
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