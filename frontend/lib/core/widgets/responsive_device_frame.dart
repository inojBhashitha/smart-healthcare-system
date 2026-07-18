import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../routes/app_routes.dart';
import '../services/console_logger.dart';
import '../services/notification_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';

class ConsoleNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    final name = route.settings.name;
    if (name != null) {
      ConsoleLogger().log(
        "Navigator: Pushed route '$name'",
        type: "action",
      );
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    final name = previousRoute?.settings.name;
    if (name != null) {
      ConsoleLogger().log(
        "Navigator: Popped back to '$name'",
        type: "action",
      );
    }
  }
}



class ResponsiveDeviceFrame extends StatefulWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  const ResponsiveDeviceFrame({
    super.key,
    required this.child,
    required this.navigatorKey,
  });

  @override
  State<ResponsiveDeviceFrame> createState() => _ResponsiveDeviceFrameState();
}

class _ResponsiveDeviceFrameState extends State<ResponsiveDeviceFrame> {
  final ScrollController _consoleScrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_consoleScrollController.hasClients) {
        _consoleScrollController.animateTo(
          _consoleScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth > 768;

    if (!isDesktop) {
      return widget.child;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF070A13),
      body: Stack(
        children: [
          // Background Gradient Orbs
          Positioned(
            top: -200,
            right: -100,
            child: _buildOrb(const Color(0xFF2563EB), 600),
          ),
          Positioned(
            bottom: -150,
            left: -100,
            child: _buildOrb(const Color(0xFF06B6D4), 500),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.4,
            child: _buildOrb(const Color(0xFF4F46E5), 400),
          ),

          Row(
            children: [
              // Left Presentation Sidebar
              _buildSidebar(context),

              // Right Simulator Workspace
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: _buildPhoneFrame(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrb(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.08),
      ),
      child: Image.network(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        color: color.withValues(alpha: 0.08),
        colorBlendMode: BlendMode.srcIn,
        errorBuilder: (context, error, stackTrace) => const SizedBox(),
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    final consoleLogger = context.watch<ConsoleLogger>();
    final notifService = context.read<NotificationService>();

    // Scroll to bottom whenever logs change
    _scrollToBottom();

    return Container(
      width: 360,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withValues(alpha: 0.6),
        border: const Border(
          right: BorderSide(
            color: Color(0xFF1E293B),
            width: 1.5,
          ),
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.md),
          // Brand Title
          Row(
            children: [
              const Icon(
                Icons.health_and_safety_rounded,
                color: AppColors.secondary,
                size: 28,
              ),
              const SizedBox(width: 8),
              Text(
                "MediSync AI",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                  shadows: [
                    Shadow(
                      color: AppColors.secondary.withValues(alpha: 0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Smart Recognition & Clinical Support System",
            style: TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // Divider
          const Divider(color: Color(0xFF1E293B)),
          const SizedBox(height: AppSpacing.lg),

          // Navigator Menu
          const Text(
            "SIMULATOR NAVIGATION",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.textDisabled,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: ListView(
              children: [
                _buildNavButton(
                  "Splash Screen",
                  Icons.rocket_launch_rounded,
                  AppRoutes.splash,
                ),
                _buildNavButton(
                  "Auth Screen",
                  Icons.lock_rounded,
                  AppRoutes.login,
                ),
                _buildNavButton(
                  "Dashboard",
                  Icons.space_dashboard_rounded,
                  AppRoutes.dashboard,
                ),
                _buildNavButton(
                  "Upload Prescription",
                  Icons.file_upload_rounded,
                  AppRoutes.uploadPrescription,
                ),
                const SizedBox(height: AppSpacing.lg),
                const Divider(color: Color(0xFF1E293B)),
                const SizedBox(height: AppSpacing.lg),
                const Text(
                  "SIMULATOR CONTROLS",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDisabled,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                // Simulator Controls Card
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B).withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(AppRadius.medium),
                    border: Border.all(
                      color: const Color(0xFF1E293B),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildControlItem(
                        "Mock Notification",
                        ElevatedButton(
                          onPressed: () {
                            notifService.triggerNotification(
                              title: "Prescription Scan Success ✅",
                              message: "Paracetamol 500mg verified successfully.",
                            );
                            ConsoleLogger().log(
                              "Triggered mock push notification.",
                              type: "warning",
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            "Trigger",
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      _buildControlItem(
                        "Reset Application",
                        ElevatedButton(
                          onPressed: () {
                            widget.navigatorKey.currentState
                                ?.pushNamedAndRemoveUntil(
                              AppRoutes.splash,
                              (route) => false,
                            );
                            ConsoleLogger().log(
                              "Simulator reset performed by user.",
                              type: "system",
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDC2626),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            "Reset",
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                // Console Log Box
                const Text(
                  "LIVE SIMULATOR LOGS",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDisabled,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF030712),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF1E293B),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    controller: _consoleScrollController,
                    itemCount: consoleLogger.logs.length,
                    itemBuilder: (context, index) {
                      final log = consoleLogger.logs[index];
                      Color logColor = Colors.green;
                      if (log.type == 'system') logColor = const Color(0xFF94A3B8);
                      if (log.type == 'warning') logColor = const Color(0xFFF59E0B);
                      if (log.type == 'error') logColor = const Color(0xFFEF4444);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          "[${DateFormat('HH:mm:ss').format(log.timestamp)}] ${log.message}",
                          style: TextStyle(
                            color: logColor,
                            fontFamily: 'Courier New',
                            fontSize: 10.5,
                            height: 1.3,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(String title, IconData icon, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          widget.navigatorKey.currentState?.pushNamedAndRemoveUntil(
            route,
            (r) => false,
          );
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF1E293B).withValues(alpha: 0.4),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.textSecondary, size: 16),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.textDisabled,
                size: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControlItem(String label, Widget control) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        control,
      ],
    );
  }

  Widget _buildPhoneFrame(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(48),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 50,
            spreadRadius: 5,
          ),
          const BoxShadow(
            color: Colors.black,
            blurRadius: 30,
            spreadRadius: 2,
            offset: Offset(0, 15),
          ),
        ],
        border: Border.all(
          color: const Color(0xFF334155),
          width: 12,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: Container(
          color: const Color(0xFF0B0F19),
          child: Stack(
            children: [
              // Dynamic Island / Notch
              Positioned(
                top: 11,
                left: 195 - 55, // Center horizontal
                child: Container(
                  width: 110,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF111827),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.2),
                              blurRadius: 1,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Mock Status Bar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 44,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Time
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          DateFormat('HH:mm').format(DateTime.now()),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Right Icons
                      const Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Row(
                          children: [
                            Icon(Icons.signal_cellular_alt_rounded, color: Colors.white, size: 12),
                            SizedBox(width: 4),
                            Icon(Icons.wifi_rounded, color: Colors.white, size: 12),
                            SizedBox(width: 4),
                            Icon(Icons.battery_5_bar_rounded, color: Colors.white, size: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Actual Phone Content Screen
              Positioned.fill(
                top: 0,
                bottom: 0,
                child: widget.child,
              ),

              // Mock Push Notification Banner Overlay
              _buildNotificationBanner(context),

              // Screen Bottom Home Indicator Bar
              Positioned(
                bottom: 8,
                left: 195 - 65,
                child: Container(
                  width: 130,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationBanner(BuildContext context) {
    final notifService = context.watch<NotificationService>();
    final isVisible = notifService.isVisible;
    final notif = notifService.activeNotification;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutBack,
      top: isVisible ? 52 : -120,
      left: 16,
      right: 16,
      child: GestureDetector(
        onTap: () => notifService.dismissNotification(),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withValues(alpha: 0.95),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  gradient: AppGradients.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.medication_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      notif?.title ?? "Notification",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      notif?.message ?? "",
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 10.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
