import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

class DashboardHeader extends StatelessWidget {

  final String userName;

  const DashboardHeader({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Evening 👋",
                style: AppTextStyles.caption,
              ),

              const SizedBox(height: AppSpacing.xs),

              Text(
                userName,
                style: AppTextStyles.headline,
              ),

              const SizedBox(height: AppSpacing.sm),

              Text(
                "Clinical Decision Support System",
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),

        CircleAvatar(
          radius: 26,
          child: Icon(Icons.person),
        ),
      ],
    );
  }
}