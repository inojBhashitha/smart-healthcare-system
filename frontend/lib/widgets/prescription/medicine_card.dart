import 'package:flutter/material.dart';

import '../../models/prescription/prescription_medicine.dart';

class MedicineCard extends StatelessWidget {
  final PrescriptionMedicine medicine;

  const MedicineCard({
    super.key,
    required this.medicine,
  });

  @override
  Widget build(BuildContext context) {
    final verified = medicine.verified;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                Icon(
                  verified
                      ? Icons.verified
                      : Icons.error_outline,
                  color: verified
                      ? Colors.green
                      : Colors.orange,
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    medicine.medicineName,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                const Icon(Icons.medication_outlined),

                const SizedBox(width: 8),

                Text(
                  medicine.strength.isEmpty
                      ? "Unknown Strength"
                      : medicine.strength,
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                const Icon(Icons.schedule),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    medicine.instruction.isEmpty
                        ? "No instructions"
                        : medicine.instruction,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Align(
              alignment: Alignment.centerRight,
              child: Chip(
                backgroundColor:
                    verified
                        ? Colors.green.shade100
                        : Colors.orange.shade100,
                label: Text(
                  verified
                      ? "Verified"
                      : "Not Verified",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}