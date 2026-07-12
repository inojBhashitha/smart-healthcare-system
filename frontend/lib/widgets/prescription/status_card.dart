import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String status;
  final int medicinesFound;
  final String uploadedAt;

  const StatusCard({
    super.key,
    required this.status,
    required this.medicinesFound,
    required this.uploadedAt,
  });

  Color get statusColor {
    switch (status) {
      case "OCR_COMPLETED":
        return Colors.green;

      case "PROCESSING":
        return Colors.orange;

      case "FAILED":
        return Colors.red;

      default:
        return Colors.blue;
    }
  }

  String get statusText {
    switch (status) {
      case "OCR_COMPLETED":
        return "OCR Completed";

      case "PROCESSING":
        return "Processing";

      case "FAILED":
        return "Failed";

      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            Row(
              children: [

                Icon(
  Icons.verified,
  color: statusColor,
  size: 26,
),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    statusText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  "Medicines Found",
                  style: TextStyle(fontSize: 16),
                ),

                Text(
                  medicinesFound.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const Divider(height: 24),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  "Uploaded",
                  style: TextStyle(fontSize: 16),
                ),

                Flexible(
                  child: Text(
                    uploadedAt,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}