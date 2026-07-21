import 'package:flutter/material.dart';
import '../models/reminder/reminder_model.dart';

class ReminderProvider extends ChangeNotifier {
  final List<ReminderModel> _reminders = [
    ReminderModel(
      id: '1',
      medicineName: 'Panadol (Paracetamol)',
      dosage: '500mg • 2 Tablets',
      time: '8:00 AM',
      instructions: 'After Meals',
      isTaken: false,
    ),
    ReminderModel(
      id: '2',
      medicineName: 'Amoxicillin Antibiotic',
      dosage: '250mg • 1 Capsule',
      time: '2:00 PM',
      instructions: 'With Water',
      isTaken: false,
    ),
    ReminderModel(
      id: '3',
      medicineName: 'Metformin Hydrochloride',
      dosage: '500mg • 1 Tablet',
      time: '8:00 PM',
      instructions: 'Before Bedtime',
      isTaken: false,
    ),
  ];

  List<ReminderModel> get reminders => _reminders;

  ReminderModel? get nextReminder {
    final pending = _reminders.where((r) => !r.isTaken).toList();
    return pending.isNotEmpty ? pending.first : null;
  }

  void toggleTaken(String id) {
    final index = _reminders.indexWhere((r) => r.id == id);
    if (index != -1) {
      _reminders[index] = _reminders[index].copyWith(
        isTaken: !_reminders[index].isTaken,
      );
      notifyListeners();
    }
  }

  void addReminder(ReminderModel reminder) {
    _reminders.add(reminder);
    notifyListeners();
  }

  void removeReminder(String id) {
    _reminders.removeWhere((r) => r.id == id);
    notifyListeners();
  }
}
