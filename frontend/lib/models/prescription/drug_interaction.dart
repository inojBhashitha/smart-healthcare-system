class DrugInteraction {
  final String drug1;
  final String drug2;
  final String description;

  DrugInteraction({
    required this.drug1,
    required this.drug2,
    required this.description,
  });

  factory DrugInteraction.fromJson(
      Map<String, dynamic> json) {
    return DrugInteraction(
      drug1: json["drug1"] ?? "",
      drug2: json["drug2"] ?? "",
      description: json["description"] ?? "",
    );
  }
}