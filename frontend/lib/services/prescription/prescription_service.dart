import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../../models/prescription/upload_prescription_response.dart';

class PrescriptionService {
  final Dio _dio = DioClient.dio;

  Future<UploadPrescriptionResponse> uploadPrescription(
      File image) async {

    final formData = FormData.fromMap({

      "file": await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),

    });

    final response = await _dio.post(
      ApiConstants.uploadPrescription,
      data: formData,
    );

    return UploadPrescriptionResponse.fromJson(
      response.data,
    );
  }
}