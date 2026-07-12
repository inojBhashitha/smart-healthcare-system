import 'package:flutter/material.dart';

import '../../models/prescription/drug_interaction.dart';

class DrugInteractionCard extends StatelessWidget {
  final DrugInteraction interaction;

  const DrugInteractionCard({
    super.key,
    required this.interaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            const Row(
              children: [

                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange,
                ),

                SizedBox(width: 10),

                Text(
                  "Drug Interaction",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Text(
              "${interaction.drug1} + ${interaction.drug2}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              interaction.description,
            ),
          ],
        ),
      ),
    );
  }
}