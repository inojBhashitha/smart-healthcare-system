import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';

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
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.large),
          child: Image.file(
            image,
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        FilledButton.icon(
          onPressed: isUploading ? null : onUpload,
          icon: isUploading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Icon(Icons.cloud_upload),
          label: Text(
            isUploading
                ? "Uploading..."
                : "Upload Prescription",
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        OutlinedButton.icon(
          onPressed: isUploading ? null : onRemove,
          icon: const Icon(Icons.delete_outline),
          label: const Text("Remove Image"),
        ),
      ],
    );
  }
}