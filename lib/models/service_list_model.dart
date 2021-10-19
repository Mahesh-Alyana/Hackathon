class ServiceListModel {
  int? id;
  String? nameOfService;
  String? slug;
  String? images;
  String? description;
  DateTime? fromTimeSlot;
  DateTime? toTimeSlot;
  int? prizePerSlot;
  int? doctor;

  ServiceListModel({
    this.id,
    this.nameOfService,
    this.slug,
    this.images,
    this.description,
    this.fromTimeSlot,
    this.toTimeSlot,
    this.prizePerSlot,
    this.doctor,
  });

  factory ServiceListModel.fromJson(Map<String, dynamic> json) {
    return ServiceListModel(
      id: json['id'] as int?,
      nameOfService: json['Name_of_service'] as String?,
      slug: json['slug'] as String?,
      images: json['images'] as String?,
      description: json['description'] as String?,
      fromTimeSlot: json['From_time_slot'] == null
          ? null
          : DateTime.parse(json['From_time_slot'] as String),
      toTimeSlot: json['To_time_slot'] == null
          ? null
          : DateTime.parse(json['To_time_slot'] as String),
      prizePerSlot: json['prize_per_slot'] as int?,
      doctor: json['Doctor'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'Name_of_service': nameOfService,
        'slug': slug,
        'images': images,
        'description': description,
        'From_time_slot': fromTimeSlot?.toIso8601String(),
        'To_time_slot': toTimeSlot?.toIso8601String(),
        'prize_per_slot': prizePerSlot,
        'Doctor': doctor,
      };
}
