import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/prescription_provider.dart';

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

            const Text(
              "Status",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 8),

            Text(prescription.status),

            const SizedBox(height: 24),

            const Text(
              "Medicines Found",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              prescription.medicinesFound.toString(),
            ),

            const SizedBox(height: 24),

            const Text(
              "OCR Text",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              prescription.extractedText,
            ),
          ],
        ),
      ),
    );
  }
}