import 'package:flutter/foundation.dart';

class LogEntry {
  final DateTime timestamp;
  final String message;
  final String type; // 'system', 'action', 'warning', 'error'

  LogEntry({
    required this.timestamp,
    required this.message,
    required this.type,
  });
}

class ConsoleLogger extends ChangeNotifier {
  static final ConsoleLogger _instance = ConsoleLogger._internal();
  factory ConsoleLogger() => _instance;
  ConsoleLogger._internal();

  final List<LogEntry> _logs = [
    LogEntry(
      timestamp: DateTime.now(),
      message: "MediSync AI Simulator ready.",
      type: "system",
    ),
  ];

  List<LogEntry> get logs => List.unmodifiable(_logs);

  void log(String message, {String type = 'system'}) {
    _logs.add(LogEntry(
      timestamp: DateTime.now(),
      message: message,
      type: type,
    ));
    notifyListeners();
  }

  void clear() {
    _logs.clear();
    _logs.add(LogEntry(
      timestamp: DateTime.now(),
      message: "Console logs cleared.",
      type: "system",
    ));
    notifyListeners();
  }
}
