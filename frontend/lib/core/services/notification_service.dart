import 'package:flutter/foundation.dart';

class MockNotification {
  final String title;
  final String message;

  MockNotification({
    required this.title,
    required this.message,
  });
}

class NotificationService extends ChangeNotifier {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  MockNotification? _activeNotification;
  bool _isVisible = false;

  MockNotification? get activeNotification => _activeNotification;
  bool get isVisible => _isVisible;

  void triggerNotification({required String title, required String message}) {
    _activeNotification = MockNotification(title: title, message: message);
    _isVisible = true;
    notifyListeners();

    // Auto-dismiss after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      dismissNotification();
    });
  }

  void dismissNotification() {
    _isVisible = false;
    notifyListeners();
  }
}
