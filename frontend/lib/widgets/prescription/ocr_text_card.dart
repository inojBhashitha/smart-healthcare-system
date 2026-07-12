import 'package:flutter/material.dart';

class OcrTextCard extends StatelessWidget {
  final String text;

  const OcrTextCard({
    super.key,
    required this.text,
  });

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
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            const Row(
              children: [

                Icon(Icons.description),

                SizedBox(width: 8),

                Text(
                  "OCR Text",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const Divider(height: 24),

            SelectableText(
              text,
              style: const TextStyle(
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}