import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Top-right electric blue orb
          Positioned(
            top: -180,
            right: -120,
            child: _glow(const Color(0xFF3B82F6), 360, 0.13),
          ),

          // Bottom-left teal orb
          Positioned(
            bottom: -200,
            left: -140,
            child: _glow(const Color(0xFF0891B2), 340, 0.10),
          ),

          // Center-left subtle purple orb
          Positioned(
            top: 300,
            left: -160,
            child: _glow(const Color(0xFF7C3AED), 300, 0.06),
          ),

          child,
        ],
      ),
    );
  }

  Widget _glow(Color color, double size, double opacity) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 110, sigmaY: 110),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color.withValues(alpha: opacity),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}