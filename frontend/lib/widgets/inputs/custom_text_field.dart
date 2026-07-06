import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_radius.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;

  final String hint;

  final bool obscure;

  const CustomTextField({

    super.key,

    required this.controller,

    required this.hint,

    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(

      controller: controller,

      obscureText: obscure,

      style: const TextStyle(
        color: AppColors.textPrimary,
      ),

      decoration: InputDecoration(

        hintText: hint,

        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
        ),

        filled: true,

        fillColor: AppColors.surface,

        border: OutlineInputBorder(

          borderRadius:
              BorderRadius.circular(AppRadius.medium),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}