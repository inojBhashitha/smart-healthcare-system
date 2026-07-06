import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_radius.dart';

class GlassCard extends StatelessWidget {

  final Widget child;

  const GlassCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius:
          BorderRadius.circular(AppRadius.large),

      child: BackdropFilter(

        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),

        child: Container(

          padding: const EdgeInsets.all(24),

          decoration: BoxDecoration(

            color: AppColors.card.withOpacity(.65),

            borderRadius:
                BorderRadius.circular(AppRadius.large),

            border: Border.all(
              color: Colors.white.withOpacity(.08),
            ),
          ),

          child: child,
        ),
      ),
    );
  }
}