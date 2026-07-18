import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_gradients.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/auth_provider.dart';
import 'widgets/active_prescription_tracker.dart';
import 'widgets/compliance_wave_painter.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/next_dose_card.dart';
import 'widgets/overview_module_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final String displayName = authProvider.userName ?? "John Doe";

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
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.md,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(height: AppSpacing.sm),

                      // 1. Dynamic Header
                      DashboardHeader(userName: displayName),

                      const SizedBox(height: AppSpacing.lg),

                      // 2. Search Bar
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F172A).withValues(alpha: 0.6),
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
                            hintText: "Search medicines, pharmacies...",
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
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      // 3. Upload Rx Document Banner
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.uploadPrescription);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF1E3A8A).withValues(alpha: 0.25),
                                const Color(0xFF0D9488).withValues(alpha: 0.1),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(AppRadius.large),
                            border: Border.all(
                              color: const Color(0xFF0D9488).withValues(alpha: 0.25),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.electric_bolt_rounded,
                                          color: AppColors.secondary,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          "Upload Rx Document",
                                          style: AppTextStyles.title.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      "Our neural networks scan handwriting in real-time, matching nearest pharmacy inventory stock instantly.",
                                      style: AppTextStyles.caption.copyWith(
                                        color: AppColors.textSecondary,
                                        height: 1.35,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              // Glowing Square Camera Button
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  gradient: AppGradients.primary,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF2563EB).withValues(alpha: 0.4),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.camera_alt_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      // 4. Section Label: OVERVIEW MODULES
                      const Text(
                        "OVERVIEW MODULES",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDisabled,
                          letterSpacing: 1.0,
                        ),
                      ),

                      const SizedBox(height: AppSpacing.md),

                      // 5. 2x2 Overview Modules Grid
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: OverviewModuleCard(
                                  title: "OCR Scan",
                                  subtitle: "Upload Prescription",
                                  icon: Icons.document_scanner_rounded,
                                  themeColor: const Color(0xFF3B82F6),
                                  onTap: () {
                                    Navigator.pushNamed(context, AppRoutes.uploadPrescription);
                                  },
                                ),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: OverviewModuleCard(
                                  title: "0",
                                  subtitle: "Reservations",
                                  icon: Icons.grid_view_rounded,
                                  themeColor: const Color(0xFF8B5CF6),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Row(
                            children: [
                              Expanded(
                                child: OverviewModuleCard(
                                  title: "Medicines",
                                  subtitle: "Intake Details",
                                  icon: Icons.medication_rounded,
                                  themeColor: const Color(0xFF0D9488),
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: OverviewModuleCard(
                                  title: "Pharmacies",
                                  subtitle: "Locate Stock Map",
                                  icon: Icons.map_rounded,
                                  themeColor: const Color(0xFF16A34A),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      // 6. Section Label: VITALS ADHERENCE RATE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "VITALS ADHERENCE RATE",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDisabled,
                              letterSpacing: 1.0,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_upward_rounded,
                                color: AppColors.success,
                                size: 12,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                "+12% THIS WEEK",
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.success,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.md),

                      // 7. Compliance Wave Chart Card
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: AppColors.card.withValues(alpha: 0.75),
                          borderRadius: BorderRadius.circular(AppRadius.large),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.05),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "94%",
                                      style: AppTextStyles.headline.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "Average Compliance",
                                      style: AppTextStyles.caption.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.success.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Text(
                                    "Optimal",
                                    style: TextStyle(
                                      color: AppColors.success,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            // Drawing the custom smooth compliance curve
                            const SizedBox(
                              width: double.infinity,
                              height: 80,
                              child: CustomPaint(
                                painter: ComplianceWavePainter(),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      // 8. Section Label: TODAY'S DOSAGE ALARMS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "TODAY'S DOSAGE ALARMS",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDisabled,
                              letterSpacing: 1.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "View All",
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.md),

                      // 9. Next Dose Card
                      const NextDoseCard(),

                      const SizedBox(height: AppSpacing.lg),

                      // 10. Active Prescription Timeline Tracker
                      const ActivePrescriptionTracker(),

                      const SizedBox(height: AppSpacing.xl),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // 11. Custom Interactive Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withValues(alpha: 0.95),
          border: const Border(
            top: BorderSide(
              color: Color(0xFF1E293B),
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Icons.home_rounded, "Home", true, () {}),
            _buildNavItem(context, Icons.local_pharmacy_rounded, "Pharmacy", false, () {}),
            
            // Circular Glowing Floating Scanner Button
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.uploadPrescription);
              },
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.primary,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF2563EB),
                      blurRadius: 15,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.qr_code_scanner_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            
            _buildNavItem(context, Icons.notifications_rounded, "Alerts", false, () {}),
            _buildNavItem(context, Icons.person_rounded, "Profile", false, () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.secondary : AppColors.textDisabled,
              size: 22,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.secondary : AppColors.textDisabled,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}