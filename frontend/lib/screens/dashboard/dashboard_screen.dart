import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/auth_provider.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/quick_actions_grid.dart';
import 'widgets/stat_card.dart';

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

                      const SizedBox(height: AppSpacing.xxl),

                      Text(
                        "Today's Overview",
                        style: AppTextStyles.title,
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      const Row(
                        children: [
                          StatCard(
                            title: "Uploads",
                            value: "12",
                            icon: Icons.upload_file,
                          ),

                          SizedBox(width: AppSpacing.md),

                          StatCard(
                            title: "Verified",
                            value: "48",
                            icon: Icons.verified,
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.md),

                      const Row(
                        children: [
                          StatCard(
                            title: "Medicines",
                            value: "154",
                            icon: Icons.medication,
                          ),

                          SizedBox(width: AppSpacing.md),

                          StatCard(
                            title: "Alerts",
                            value: "3",
                            icon: Icons.warning_amber_rounded,
                          ),
                        ],
                      ),

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