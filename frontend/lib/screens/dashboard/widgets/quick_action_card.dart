import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';

class QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
          BorderRadius.circular(AppRadius.large),

      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),

        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius:
              BorderRadius.circular(AppRadius.large),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              color: AppColors.primary,
              size: 34,
            ),

            const SizedBox(height: AppSpacing.md),

            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}