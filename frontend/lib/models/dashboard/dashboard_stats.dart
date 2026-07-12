class DashboardStats {
  final int totalPrescriptions;
  final int totalMedicines;
  final int verifiedMedicines;
  final int totalInteractions;

  DashboardStats({
    required this.totalPrescriptions,
    required this.totalMedicines,
    required this.verifiedMedicines,
    required this.totalInteractions,
  });

  factory DashboardStats.fromJson(
      Map<String, dynamic> json) {
    return DashboardStats(
      totalPrescriptions: json["totalPrescriptions"] ?? 0,
      totalMedicines: json["totalMedicines"] ?? 0,
      verifiedMedicines: json["verifiedMedicines"] ?? 0,
      totalInteractions: json["totalInteractions"] ?? 0,
    );
  }
}