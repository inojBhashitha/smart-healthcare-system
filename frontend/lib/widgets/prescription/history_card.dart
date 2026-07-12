import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/prescription/prescription_summary.dart';

class HistoryCard extends StatelessWidget {
  final PrescriptionSummary prescription;
  final VoidCallback onTap;

  const HistoryCard({
    super.key,
    required this.prescription,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor =
        prescription.status == "OCR_COMPLETED"
            ? Colors.green
            : Colors.orange;

    final formattedDate = DateFormat(
      "dd MMM yyyy • h:mm a",
    ).format(
      DateTime.parse(
        prescription.uploadedAt,
      ),
    );

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              Row(
                children: [

                  Icon(
                    Icons.verified,
                    color: statusColor,
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      prescription.status.replaceAll(
                        "_",
                        " ",
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.chevron_right,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [

                  const Icon(
                    Icons.medication,
                    size: 20,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    "${prescription.medicinesFound} Medicines",
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [

                  const Icon(
                    Icons.calendar_today,
                    size: 20,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    formattedDate,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}