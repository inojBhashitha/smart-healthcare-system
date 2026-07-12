import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/prescription_provider.dart';
import '../../../widgets/prescription/drug_interaction_card.dart';
import '../../../widgets/prescription/medicine_card.dart';
import '../../../widgets/prescription/ocr_text_card.dart';
import '../../../widgets/prescription/status_card.dart';

class PrescriptionDetailsScreen extends StatelessWidget {
  const PrescriptionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PrescriptionProvider>();
    final prescription = provider.prescriptionDetails;

    if (prescription == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescription Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Status Card
            StatusCard(
              status: prescription.status,
              medicinesFound: prescription.medicinesFound,
              uploadedAt: prescription.uploadedAt,
            ),

            const SizedBox(height: 20),

            /// OCR Text Card
            OcrTextCard(
              text: prescription.extractedText,
            ),

            const SizedBox(height: 20),

            /// Medicines Section
            const Text(
              "Medicines",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...prescription.medicines.map(
              (medicine) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: MedicineCard(
                  medicine: medicine,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Drug Interactions Section
            const Text(
              "Drug Interactions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            if (prescription.drugInteractions.isEmpty)
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified,
                        color: Colors.green,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "No drug interactions were found for this prescription.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              ...prescription.drugInteractions.map(
                (interaction) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: DrugInteractionCard(
                    interaction: interaction,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}