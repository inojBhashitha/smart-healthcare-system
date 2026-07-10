import 'package:flutter/material.dart';

import 'widgets/source_picker_sheet.dart';
import 'widgets/upload_drop_zone.dart';

import 'package:provider/provider.dart';

import '../../../providers/prescription_provider.dart';
import 'widgets/image_preview.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Prescription"),
      ),
      body: Consumer<PrescriptionProvider>(
  builder: (context, provider, child) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: provider.selectedImage == null
          ? UploadDropZone(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => SourcePickerSheet(
                    onCamera: () async {
                      Navigator.pop(context);

                      await provider.pickFromCamera();
                    },
                    onGallery: () async {
                      Navigator.pop(context);

                      await provider.pickFromGallery();
                    },
                  ),
                );
              },
            )
          : ImagePreview(
  image: provider.selectedImage!,
  isUploading: provider.isUploading,

  onRemove: provider.removeImage,

  onUpload: () async {
    await provider.uploadPrescription();

    if (!context.mounted) return;

    final response = provider.uploadResponse;

    if (response != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
        ),
      );
    }
  },
),
    );
  },
),
    );
  }
}