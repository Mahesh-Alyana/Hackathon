class Report {
	String? name;
	int? patient;
	int? service;
	String? description;
	String? image;

	Report({
		this.name, 
		this.patient, 
		this.service, 
		this.description, 
		this.image, 
	});

	factory Report.fromJson(Map<String, dynamic> json) => Report(
				name: json['name'] as String?,
				patient: json['patient'] as int?,
				service: json['service'] as int?,
				description: json['description'] as String?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'patient': patient,
				'service': service,
				'description': description,
				'image': image,
			};
}
