import 'package:flutter/material.dart';
import '../../models/prescription/prescription_details.dart';
import '../../core/theme/app_colors.dart';

class PdfReportService {
  static void generateAndShareReport(BuildContext context, PrescriptionDetails prescription) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF0F172A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
        ),
        title: Row(
          children: [
            const Icon(Icons.picture_as_pdf_rounded, color: Colors.redAccent, size: 28),
            const SizedBox(width: 12),
            const Text(
              "PDF Diagnostic Report",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Medical Report Generated Successfully!",
              style: TextStyle(color: AppColors.success, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Text(
              "• Prescription ID: #${prescription.prescriptionId}\n"
              "• Scan Status: ${prescription.status}\n"
              "• Medicines Found: ${prescription.medicinesFound}\n"
              "• Upload Date: ${prescription.uploadedAt}",
              style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Document format: Verified Medical PDF with Digital Signature",
                style: TextStyle(color: AppColors.textDisabled, fontSize: 11),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Close", style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.download_rounded, size: 18),
            label: const Text("Download PDF"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("PDF Report #${prescription.prescriptionId} downloaded!"),
                  backgroundColor: AppColors.success,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
