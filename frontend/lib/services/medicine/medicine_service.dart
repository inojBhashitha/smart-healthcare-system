import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../../models/prescription/drug_interaction.dart';

class MedicineService {
  final Dio _dio = DioClient.dio;

  Future<List<Map<String, dynamic>>> getMedicines() async {
    final response = await _dio.get(ApiConstants.medicines);
    final List list = response.data as List? ?? [];
    return list.cast<Map<String, dynamic>>();
  }

  Future<Map<String, dynamic>> validateMedicine(String medicineName) async {
    final response = await _dio.get("${ApiConstants.medicineValidation}/$medicineName");
    return response.data as Map<String, dynamic>? ?? {};
  }

  Future<List<DrugInteraction>> checkInteractions(List<String> medicines) async {
    final response = await _dio.post(
      ApiConstants.drugInteractionsCheck,
      data: medicines,
    );
    final List list = response.data as List? ?? [];
    return list.map((item) => DrugInteraction.fromJson(item)).toList();
  }
}
