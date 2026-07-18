import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

class WeeklyAnalyticsChart extends StatelessWidget {
  const WeeklyAnalyticsChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded analytics data for demo/presentation
    final List<Map<String, dynamic>> data = [
      {"day": "Mon", "value": 3, "isActive": false},
      {"day": "Tue", "value": 5, "isActive": false},
      {"day": "Wed", "value": 2, "isActive": false},
      {"day": "Thu", "value": 8, "isActive": true}, // Max value is highlighted
      {"day": "Fri", "value": 4, "isActive": false},
      {"day": "Sat", "value": 1, "isActive": false},
      {"day": "Sun", "value": 6, "isActive": false},
    ];

    const double maxBarHeight = 100.0;
    const int maxVal = 8;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.card.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(AppRadius.large),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Activity Analytics",
                    style: AppTextStyles.title.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Prescriptions processed this week",
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.trending_up_rounded,
                      color: AppColors.primary,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Total: 29",
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: data.map((item) {
              final double height = (item["value"] / maxVal) * maxBarHeight;
              final bool isActive = item["isActive"];

              return Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Background track
                      Container(
                        width: 14,
                        height: maxBarHeight,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.04),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // Value bar
                      Container(
                        width: 14,
                        height: height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isActive
                                ? const [Color(0xFF06B6D4), Color(0xFF2563EB)]
                                : const [Color(0xFF1E293B), Color(0xFF475569)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: isActive
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFF06B6D4)
                                        .withValues(alpha: 0.35),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ]
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item["day"],
                    style: TextStyle(
                      color: isActive ? Colors.white : AppColors.textSecondary,
                      fontSize: 11,
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
