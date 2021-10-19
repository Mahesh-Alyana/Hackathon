import 'patient.dart';

class PatientListModel {
	String? nameOfService;
	List<Patient>? patient;

	PatientListModel({this.nameOfService, this.patient});

	factory PatientListModel.fromJson(Map<String, dynamic> json) {
		return PatientListModel(
			nameOfService: json['Name_of_service'] as String?,
			patient: (json['patient'] as List<dynamic>?)
						?.map((e) => Patient.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}

	Map<String, dynamic> toJson() => {
				'Name_of_service': nameOfService,
				'patient': patient?.map((e) => e.toJson()).toList(),
			};
}
