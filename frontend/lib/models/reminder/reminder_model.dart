class ReminderModel {
  final String id;
  final String medicineName;
  final String dosage;
  final String time;
  final String instructions;
  final bool isTaken;

  ReminderModel({
    required this.id,
    required this.medicineName,
    required this.dosage,
    required this.time,
    required this.instructions,
    this.isTaken = false,
  });

  ReminderModel copyWith({
    String? id,
    String? medicineName,
    String? dosage,
    String? time,
    String? instructions,
    bool? isTaken,
  }) {
    return ReminderModel(
      id: id ?? this.id,
      medicineName: medicineName ?? this.medicineName,
      dosage: dosage ?? this.dosage,
      time: time ?? this.time,
      instructions: instructions ?? this.instructions,
      isTaken: isTaken ?? this.isTaken,
    );
  }

  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      id: json['id'] ?? '',
      medicineName: json['medicineName'] ?? '',
      dosage: json['dosage'] ?? '',
      time: json['time'] ?? '',
      instructions: json['instructions'] ?? '',
      isTaken: json['isTaken'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medicineName': medicineName,
      'dosage': dosage,
      'time': time,
      'instructions': instructions,
      'isTaken': isTaken,
    };
  }
}
