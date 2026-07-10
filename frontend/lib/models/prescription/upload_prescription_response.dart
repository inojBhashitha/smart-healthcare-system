class UploadPrescriptionResponse {
  final int? prescriptionId;
  final String? filename;
  final String status;
  final String message;

  UploadPrescriptionResponse({
    required this.prescriptionId,
    required this.filename,
    required this.status,
    required this.message,
  });

  factory UploadPrescriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return UploadPrescriptionResponse(
      prescriptionId: json["prescriptionId"],
      filename: json["filename"],
      status: json["status"] ?? "",
      message: json["message"] ?? "",
    );
  }
}