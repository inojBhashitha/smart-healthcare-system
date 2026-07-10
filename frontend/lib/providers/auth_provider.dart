import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../models/auth/auth_response.dart';
import '../models/auth/login_request.dart';
import '../models/auth/register_request.dart';
import '../services/auth/auth_service.dart';
import '../core/network/token_storage.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  AuthResponse? _authResponse;

  AuthResponse? get authResponse => _authResponse;



  Future<void> login({
  required String email,
  required String password,
}) async {
  _isLoading = true;
  notifyListeners();

  try {
    _authResponse = await _authService.login(
      LoginRequest(
        email: email,
        password: password,
      ),
    );

    // Save JWT
    await TokenStorage.saveToken(
      _authResponse!.token,
    );

    debugPrint("JWT Saved:");
    debugPrint(_authResponse!.token);

    final token = await TokenStorage.getToken();

    debugPrint("Stored Token:");
    debugPrint(token);
  } finally {
    _isLoading = false;
    notifyListeners();
  }
}

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      _authResponse = await _authService.register(
        RegisterRequest(
          name: name,
          email: email,
          password: password,
          role: AppConstants.pharmacistRole,
        ),
      );

      await TokenStorage.saveToken(
  _authResponse!.token,
);

    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
  await TokenStorage.deleteToken();

  _authResponse = null;

  notifyListeners();
}

Future<bool> isLoggedIn() async {
  return await TokenStorage.hasToken();
}
}