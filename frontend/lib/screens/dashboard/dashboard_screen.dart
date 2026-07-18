import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/auth_provider.dart';
import 'widgets/active_prescription_tracker.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/next_dose_card.dart';
import 'widgets/quick_actions_grid.dart';
import 'widgets/stat_card.dart';
import 'widgets/weekly_analytics_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(
              const Duration(seconds: 1),
            );
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(AppSpacing.lg),

                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [

                      DashboardHeader(
                        userName: (context.watch<AuthProvider>().userName ?? "Guest").split(" ").first,
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      // Premium Search Bar
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.card.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(AppRadius.medium),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.05),
                            width: 1.2,
                          ),
                        ),
                        child: const TextField(
                          readOnly: true,
                          style: TextStyle(color: AppColors.textPrimary),
                          decoration: InputDecoration(
                            hintText: "Search prescriptions or medicines...",
                            hintStyle: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: AppColors.textSecondary,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xxl),

                      // Next Scheduled Dose Reminder
                      const NextDoseCard(),

                      const SizedBox(height: AppSpacing.lg),

                      // Active Prescription Timeline Tracker
                      const ActivePrescriptionTracker(),

                      const SizedBox(height: AppSpacing.xxl),


                      Text(
                        "Today's Overview",
                        style: AppTextStyles.title,
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      Row(
                        children: [
                          StatCard(
                            title: "Uploads",
                            value: "12",
                            icon: Icons.upload_file_rounded,
                            gradientColors: const [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                            shadowColor: const Color(0xFF2563EB),
                          ),

                          const SizedBox(width: AppSpacing.md),

                          StatCard(
                            title: "Verified",
                            value: "48",
                            icon: Icons.verified_rounded,
                            gradientColors: const [Color(0xFF10B981), Color(0xFF047857)],
                            shadowColor: const Color(0xFF10B981),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.md),

                      Row(
                        children: [
                          StatCard(
                            title: "Medicines",
                            value: "154",
                            icon: Icons.medication_rounded,
                            gradientColors: const [Color(0xFF6366F1), Color(0xFF4338CA)],
                            shadowColor: const Color(0xFF6366F1),
                          ),

                          const SizedBox(width: AppSpacing.md),

                          StatCard(
                            title: "Alerts",
                            value: "3",
                            icon: Icons.warning_amber_rounded,
                            gradientColors: const [Color(0xFFEF4444), Color(0xFFB91C1C)],
                            shadowColor: const Color(0xFFEF4444),
                          ),
                        ],
                      ),


                      const SizedBox(height: AppSpacing.xxl),

                      // Weekly Prescription Activity Analytics Chart
                      const WeeklyAnalyticsChart(),

                      const SizedBox(height: AppSpacing.xxl),

                      Text(
                        "Quick Actions",
                        style: AppTextStyles.title,
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      const QuickActionsGrid(),

                      const SizedBox(height: AppSpacing.xxl),

                      Text(
                        "Recent Activity",
                        style: AppTextStyles.title,
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.history),
                          title: const Text(
                            "No recent activity",
                          ),
                          subtitle: const Text(
                            "Activity will appear here after using the app.",
                          ),
                        ),
                      ),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}