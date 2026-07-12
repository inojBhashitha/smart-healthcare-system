import 'drug_interaction.dart';
import 'prescription_medicine.dart';

class PrescriptionDetails {
  final int prescriptionId;
  final String imagePath;
  final String extractedText;
  final int medicinesFound;
  final String status;
  final String uploadedAt;

  final List<PrescriptionMedicine> medicines;
  final List<DrugInteraction> drugInteractions;

  PrescriptionDetails({
    required this.prescriptionId,
    required this.imagePath,
    required this.extractedText,
    required this.medicinesFound,
    required this.status,
    required this.uploadedAt,
    required this.medicines,
    required this.drugInteractions,
  });

  factory PrescriptionDetails.fromJson(
      Map<String, dynamic> json) {
    return PrescriptionDetails(
      prescriptionId: json["prescriptionId"] ?? 0,
      imagePath: json["imagePath"] ?? "",
      extractedText: json["extractedText"] ?? "",
      medicinesFound: json["medicinesFound"] ?? 0,
      status: json["status"] ?? "",
      uploadedAt: json["uploadedAt"] ?? "",
      medicines: (json["medicines"] as List? ?? [])
          .map(
            (e) => PrescriptionMedicine.fromJson(e),
          )
          .toList(),
      drugInteractions:
          (json["drugInteractions"] as List? ?? [])
              .map(
                (e) => DrugInteraction.fromJson(e),
              )
              .toList(),
    );
  }
}