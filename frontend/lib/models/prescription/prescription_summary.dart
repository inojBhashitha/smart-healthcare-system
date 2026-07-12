class PrescriptionSummary {
  final int prescriptionId;
  final String status;
  final int medicinesFound;
  final String uploadedAt;

  PrescriptionSummary({
    required this.prescriptionId,
    required this.status,
    required this.medicinesFound,
    required this.uploadedAt,
  });

  factory PrescriptionSummary.fromJson(
      Map<String, dynamic> json) {
    return PrescriptionSummary(
      prescriptionId: json["prescriptionId"] ?? 0,
      status: json["status"] ?? "",
      medicinesFound: json["medicinesFound"] ?? 0,
      uploadedAt: json["uploadedAt"] ?? "",
    );
  }
}