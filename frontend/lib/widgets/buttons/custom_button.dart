import 'package:flutter/material.dart';

import '../core/theme/app_gradients.dart';
import '../core/theme/app_radius.dart';
import '../core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(

      borderRadius:
          BorderRadius.circular(AppRadius.medium),

      onTap: onPressed,

      child: Ink(

        height: 58,

        decoration: BoxDecoration(

          gradient: AppGradients.primary,

          borderRadius:
              BorderRadius.circular(AppRadius.medium),
        ),

        child: Center(

          child: Text(
            text,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}