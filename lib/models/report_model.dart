import 'report.dart';

class ReportModel {
	String? date;
	String? timeSlot;
	int? payedAmount;
	bool? payment;
	List<Report>? reports;

	ReportModel({
		this.date, 
		this.timeSlot, 
		this.payedAmount, 
		this.payment, 
		this.reports, 
	});

	factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
				date: json['date'] as String?,
				timeSlot: json['time_slot'] as String?,
				payedAmount: json['payed_amount'] as int?,
				payment: json['payment'] as bool?,
				reports: (json['reports'] as List<dynamic>?)
						?.map((e) => Report.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'date': date,
				'time_slot': timeSlot,
				'payed_amount': payedAmount,
				'payment': payment,
				'reports': reports?.map((e) => e.toJson()).toList(),
			};
}
