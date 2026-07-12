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
    final db = medicine.databaseMedicine;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(
          18,
          0,
          18,
          18,
        ),
        leading: Icon(
          verified
              ? Icons.verified
              : Icons.error_outline,
          color: verified
              ? Colors.green
              : Colors.orange,
        ),
        title: Text(
          medicine.medicineName,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.medication_outlined,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    medicine.strength.isEmpty
                        ? "Unknown Strength"
                        : medicine.strength,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.schedule,
                  size: 18,
                ),
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

            const SizedBox(height: 12),

            Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                backgroundColor: verified
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

        children: [

          if (db == null)

            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "No additional medicine information available.",
              ),
            )

          else

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                const Divider(),

                _InfoTile(
                  title: "Generic Name",
                  value: db.genericName,
                  icon: Icons.science,
                ),

                _InfoTile(
                  title: "Brand Name",
                  value: db.brandName,
                  icon: Icons.local_pharmacy,
                ),

                _InfoTile(
                  title: "Category",
                  value: db.category,
                  icon: Icons.category,
                ),

                _InfoTile(
                  title: "Description",
                  value: db.description,
                  icon: Icons.description,
                ),

                _InfoTile(
                  title: "Side Effects",
                  value: db.sideEffects,
                  icon: Icons.warning_amber_rounded,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _InfoTile({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value.isEmpty
                      ? "Not Available"
                      : value,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}