import 'dart:io';

import 'package:flutter/material.dart';

import '../models/prescription/prescription_details.dart';
import '../models/prescription/prescription_summary.dart';
import '../models/prescription/upload_prescription_response.dart';
import '../services/image/image_picker_service.dart';
import '../services/prescription/prescription_service.dart';

class PrescriptionProvider extends ChangeNotifier {
  final ImagePickerService _pickerService = ImagePickerService();
  final PrescriptionService _prescriptionService = PrescriptionService();

  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  PrescriptionDetails? _prescriptionDetails;
  PrescriptionDetails? get prescriptionDetails => _prescriptionDetails;

  List<PrescriptionSummary> _prescriptions = [];
  List<PrescriptionSummary> get prescriptions => _prescriptions;

  bool _isLoadingList = false;
  bool get isLoadingList => _isLoadingList;

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

  Future<void> fetchPrescriptions() async {
    _isLoadingList = true;
    notifyListeners();

    try {
      _prescriptions = await _prescriptionService.getPrescriptions();
      if (_prescriptions.isNotEmpty) {
        final latestId = _prescriptions.first.prescriptionId;
        await loadPrescription(latestId);
      }
    } catch (e) {
      debugPrint("Error fetching prescriptions: $e");
    } finally {
      _isLoadingList = false;
      notifyListeners();
    }
  }

  Future<void> uploadPrescription() async {
    if (_selectedImage == null) return;

    _isUploading = true;
    notifyListeners();

    try {
      _uploadResponse = await _prescriptionService.uploadPrescription(
        _selectedImage!,
      );

      if (_uploadResponse?.prescriptionId != null) {
        await loadPrescription(
          _uploadResponse!.prescriptionId!,
        );
        await fetchPrescriptions();
      }
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }

  Future<void> loadPrescription(int prescriptionId) async {
    try {
      _prescriptionDetails = await _prescriptionService.getPrescription(
        prescriptionId,
      );
    } catch (e) {
      debugPrint("Error loading prescription details: $e");
    }
    notifyListeners();
  }
}