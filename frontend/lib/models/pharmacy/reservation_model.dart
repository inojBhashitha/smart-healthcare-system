class ReservationModel {
  final String reservationId;
  final String pharmacyName;
  final String pharmacyAddress;
  final List<String> medicines;
  final String pickupCode;
  final String createdAt;
  final String status;

  ReservationModel({
    required this.reservationId,
    required this.pharmacyName,
    required this.pharmacyAddress,
    required this.medicines,
    required this.pickupCode,
    required this.createdAt,
    this.status = 'READY_FOR_PICKUP',
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      reservationId: json['reservationId'] ?? '',
      pharmacyName: json['pharmacyName'] ?? '',
      pharmacyAddress: json['pharmacyAddress'] ?? '',
      medicines: (json['medicines'] as List? ?? []).cast<String>(),
      pickupCode: json['pickupCode'] ?? '',
      createdAt: json['createdAt'] ?? '',
      status: json['status'] ?? 'READY_FOR_PICKUP',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservationId': reservationId,
      'pharmacyName': pharmacyName,
      'pharmacyAddress': pharmacyAddress,
      'medicines': medicines,
      'pickupCode': pickupCode,
      'createdAt': createdAt,
      'status': status,
    };
  }
}
