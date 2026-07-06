import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class AppLogo extends StatelessWidget {

  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 90,
      width: 90,

      decoration: BoxDecoration(

        gradient: const LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
        ),

        borderRadius:
            BorderRadius.circular(30),
      ),

      child: const Icon(
        Icons.medical_services_rounded,
        color: Colors.white,
        size: 48,
      ),
    );
  }
}