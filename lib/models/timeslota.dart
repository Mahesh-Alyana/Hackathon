class Timeslota {
	String? times;

	Timeslota({this.times});

	factory Timeslota.fromJson(Map<String, dynamic> json) => Timeslota(
				times: json['times'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'times': times,
			};
}
