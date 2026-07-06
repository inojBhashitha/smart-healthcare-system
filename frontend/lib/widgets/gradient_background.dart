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

          Positioned(
            top: -150,
            right: -100,
            child: _blurCircle(
              Colors.blue.withOpacity(0.30),
              320,
            ),
          ),

          Positioned(
            bottom: -180,
            left: -120,
            child: _blurCircle(
              Colors.cyan.withOpacity(0.20),
              300,
            ),
          ),

          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _blurCircle(Color color, double size) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 100,
        sigmaY: 100,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}