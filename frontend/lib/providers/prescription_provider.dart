import 'dart:io';

import 'package:flutter/material.dart';

import '../models/prescription/upload_prescription_response.dart';
import '../services/image/image_picker_service.dart';
import '../services/prescription/prescription_service.dart';

class PrescriptionProvider extends ChangeNotifier {
  final ImagePickerService _pickerService = ImagePickerService();
  final PrescriptionService _prescriptionService = PrescriptionService();

  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  bool _isUploading = false;
  bool get isUploading => _isUploading;

  UploadPrescriptionResponse? _uploadResponse;
  UploadPrescriptionResponse? get uploadResponse => _uploadResponse;

  Future<void> pickFromCamera() async {
    _selectedImage = await _pickerService.pickFromCamera();
    notifyListeners();
  }

  Future<void> pickFromGallery() async {
    _selectedImage = await _pickerService.pickFromGallery();
    notifyListeners();
  }

  void removeImage() {
    _selectedImage = null;
    _uploadResponse = null;
    notifyListeners();
  }

  Future<void> uploadPrescription() async {
    if (_selectedImage == null) return;

    _isUploading = true;
    notifyListeners();

    try {
      _uploadResponse = await _prescriptionService.uploadPrescription(
        _selectedImage!,
      );
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }
}