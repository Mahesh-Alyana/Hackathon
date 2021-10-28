class SchemeDataModel {
  int? id;
  String? name;
  String? description;
  int? elibleAge;
  String? categortyElible;
  String? lastDateEligble;

  SchemeDataModel({
    this.id,
    this.name,
    this.description,
    this.elibleAge,
    this.categortyElible,
    this.lastDateEligble,
  });

  factory SchemeDataModel.fromJson(Map<String, dynamic> json) =>
      SchemeDataModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        elibleAge: json['elible_age'] as int?,
        categortyElible: json['categorty_elible'] as String?,
        lastDateEligble: json['last_Date_eligble'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'elible_age': elibleAge,
        'categorty_elible': categortyElible,
        'last_Date_eligble': lastDateEligble,
      };
}
