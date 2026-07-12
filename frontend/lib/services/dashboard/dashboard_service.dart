import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../../models/dashboard/dashboard_stats.dart';

class DashboardService {
  final Dio _dio = DioClient.dio;

  Future<DashboardStats> getDashboardStats() async {
    final response = await _dio.get(
  ApiConstants.dashboardStats,
);

    return DashboardStats.fromJson(
      response.data,
    );
  }
}