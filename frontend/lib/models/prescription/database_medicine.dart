class DatabaseMedicine {
  final int medicineId;
  final String genericName;
  final String brandName;
  final String category;
  final String description;
  final String sideEffects;

  DatabaseMedicine({
    required this.medicineId,
    required this.genericName,
    required this.brandName,
    required this.category,
    required this.description,
    required this.sideEffects,
  });

  factory DatabaseMedicine.fromJson(
      Map<String, dynamic> json) {
    return DatabaseMedicine(
      medicineId: json["medicineId"] ?? 0,
      genericName: json["genericName"] ?? "",
      brandName: json["brandName"] ?? "",
      category: json["category"] ?? "",
      description: json["description"] ?? "",
      sideEffects: json["sideEffects"] ?? "",
    );
  }
}