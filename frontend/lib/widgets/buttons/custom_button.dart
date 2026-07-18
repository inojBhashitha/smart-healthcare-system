import 'package:flutter/material.dart';

import '../../core/theme/app_gradients.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_styles.dart';
import '../loading/loading_indicator.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final bool isLoading;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  double scale = 1;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTapDown: (_) {
        setState(() => scale = .97);
      },

      onTapUp: (_) {
        setState(() => scale = 1);
        widget.onPressed?.call();
      },

      onTapCancel: () {
        setState(() => scale = 1);
      },

      child: AnimatedScale(

        duration: const Duration(milliseconds: 120),

        scale: scale,

        child: Container(

          width: double.infinity,

          height: 58,

          decoration: BoxDecoration(

            gradient: AppGradients.primary,

            borderRadius:
                BorderRadius.circular(AppRadius.medium),

            boxShadow: [

              BoxShadow(
                color: Colors.blue.withValues(alpha: .35),
                blurRadius: 25,
                offset: const Offset(0, 12),
              ),
            ],

          ),

          child: Center(

            child: widget.isLoading

                ? const LoadingIndicator(
                    size: 30,
                    color: Colors.white,
                  )

                : Row(

                    mainAxisSize: MainAxisSize.min,

                    children: [

                      if (widget.icon != null) ...[
                        Icon(
                          widget.icon,
                          color: Colors.white,
                        ),

                        const SizedBox(width: 10),
                      ],

                      Text(
                        widget.text,
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}