import 'package:flutter/material.dart';

import '../models/dashboard/dashboard_stats.dart';
import '../services/dashboard/dashboard_service.dart';

class DashboardProvider extends ChangeNotifier {
  final DashboardService _dashboardService = DashboardService();

  DashboardStats? _stats;

  DashboardStats? get stats => _stats;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> loadDashboardStats() async {
    _isLoading = true;
    notifyListeners();

    try {
      _stats = await _dashboardService.getDashboardStats();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}