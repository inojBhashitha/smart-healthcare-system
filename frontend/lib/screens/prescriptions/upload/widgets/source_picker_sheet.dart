import 'package:flutter/material.dart';

class SourcePickerSheet extends StatelessWidget {
  final VoidCallback onCamera;
  final VoidCallback onGallery;

  const SourcePickerSheet({
    super.key,
    required this.onCamera,
    required this.onGallery,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              subtitle: const Text("Take a new prescription photo"),
              onTap: onCamera,
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Gallery"),
              subtitle: const Text("Choose from your gallery"),
              onTap: onGallery,
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text("Cancel"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}