import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';
import 'quick_action_card.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.3,
      children: [
        QuickActionCard(
          title: "Upload",
          icon: Icons.upload_file,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.uploadPrescription,
            );
          },
        ),

        QuickActionCard(
          title: "History",
          icon: Icons.history,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.prescriptionHistory,
            );
          },
        ),

        QuickActionCard(
          title: "Interactions",
          icon: Icons.warning_amber_rounded,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Drug interaction dashboard coming soon.",
                ),
              ),
            );
          },
        ),

        QuickActionCard(
          title: "Profile",
          icon: Icons.person,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Profile screen coming soon.",
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}