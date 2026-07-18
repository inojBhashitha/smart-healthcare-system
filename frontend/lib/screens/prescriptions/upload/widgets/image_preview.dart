import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../widgets/buttons/custom_button.dart';

class ImagePreview extends StatelessWidget {
  final File image;
  final bool isUploading;
  final VoidCallback onRemove;
  final VoidCallback onUpload;

  const ImagePreview({
    super.key,
    required this.image,
    required this.isUploading,
    required this.onRemove,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 380,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.large),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.large - 1.5),
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        CustomButton(
          text: isUploading ? "Uploading..." : "Upload & Analyze",
          icon: isUploading ? null : Icons.analytics_rounded,
          isLoading: isUploading,
          onPressed: onUpload,
        ),

        const SizedBox(height: AppSpacing.md),

        OutlinedButton.icon(
          onPressed: isUploading ? null : onRemove,
          icon: const Icon(Icons.delete_outline_rounded, size: 18),
          label: const Text(
            "Remove Image",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.danger,
            side: const BorderSide(color: AppColors.danger, width: 1.2),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.medium),
            ),
          ),
        ),
      ],
    );
  }
}