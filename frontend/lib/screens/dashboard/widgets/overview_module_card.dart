import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';

class OverviewModuleCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color themeColor;
  final VoidCallback onTap;

  const OverviewModuleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.themeColor,
    required this.onTap,
  });

  @override
  State<OverviewModuleCard> createState() => _OverviewModuleCardState();
}

class _OverviewModuleCardState extends State<OverviewModuleCard> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.96),
      onTapUp: (_) {
        setState(() => _scale = 1.0);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          height: 125,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: widget.themeColor.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(AppRadius.large),
            border: Border.all(
              color: widget.themeColor.withValues(alpha: 0.15),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.themeColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      widget.icon,
                      color: widget.themeColor,
                      size: 20,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: widget.themeColor,
                    size: 14,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                widget.subtitle,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
