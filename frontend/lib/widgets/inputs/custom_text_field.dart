import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? label;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.label,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = true;
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        if (widget.label != null) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.label!,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],

        AnimatedContainer(
          duration: const Duration(milliseconds: 250),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.medium),

            boxShadow: isFocused
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: .20),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),

          child: Focus(
            onFocusChange: (focus) {
              setState(() {
                isFocused = focus;
              });
            },

            child: TextField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword ? obscure : false,

              style: const TextStyle(
                color: AppColors.textPrimary,
              ),

              decoration: InputDecoration(
                hintText: widget.hintText,

                prefixIcon: Icon(
                  widget.prefixIcon,
                  color: isFocused
                      ? AppColors.primary
                      : AppColors.textSecondary,
                ),

                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            obscure
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            key: ValueKey(obscure),
                            color: AppColors.textSecondary,
                          ),
                        ),
                      )
                    : null,

                filled: true,
                fillColor: AppColors.surface,

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppRadius.medium),
                  borderSide: BorderSide.none,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppRadius.medium),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: .05),
                  ),
                ),


                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppRadius.medium),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}