import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/dashboard_provider.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/quick_actions_grid.dart';
import 'widgets/stat_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState
    extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<DashboardProvider>()
          .loadDashboardStats();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboardProvider =
        context.watch<DashboardProvider>();

    final stats = dashboardProvider.stats;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await context
                .read<DashboardProvider>()
                .loadDashboardStats();
          },
          child: CustomScrollView(
            physics:
                const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding:
                    const EdgeInsets.all(AppSpacing.lg),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const DashboardHeader(
                        userName: "Inoj",
                      ),

                      const SizedBox(
                        height: AppSpacing.xxl,
                      ),

                      Text(
                        "Today's Overview",
                        style: AppTextStyles.title,
                      ),

                      const SizedBox(
                        height: AppSpacing.lg,
                      ),

                      Row(
                        children: [
                          StatCard(
                            title: "Uploads",
                            value: stats == null
                                ? "--"
                                : stats
                                    .totalPrescriptions
                                    .toString(),
                            icon: Icons.upload_file,
                          ),

                          const SizedBox(
                            width: AppSpacing.md,
                          ),

                          StatCard(
                            title: "Verified",
                            value: stats == null
                                ? "--"
                                : stats
                                    .verifiedMedicines
                                    .toString(),
                            icon: Icons.verified,
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: AppSpacing.md,
                      ),

                      Row(
                        children: [
                          StatCard(
                            title: "Medicines",
                            value: stats == null
                                ? "--"
                                : stats
                                    .totalMedicines
                                    .toString(),
                            icon: Icons.medication,
                          ),

                          const SizedBox(
                            width: AppSpacing.md,
                          ),

                          StatCard(
                            title: "Interactions",
                            value: stats == null
                                ? "--"
                                : stats
                                    .totalInteractions
                                    .toString(),
                            icon: Icons.warning_amber_rounded,
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: AppSpacing.xxl,
                      ),

                      Text(
                        "Quick Actions",
                        style: AppTextStyles.title,
                      ),

                      const SizedBox(
                        height: AppSpacing.lg,
                      ),

                      const QuickActionsGrid(),

                      const SizedBox(
                        height: AppSpacing.xxl,
                      ),

                      Text(
                        "Recent Activity",
                        style: AppTextStyles.title,
                      ),

                      const SizedBox(
                        height: AppSpacing.lg,
                      ),

                      const Card(
                        child: ListTile(
                          leading: Icon(Icons.history),
                          title: Text(
                            "No recent activity",
                          ),
                          subtitle: Text(
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