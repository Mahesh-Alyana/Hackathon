class BookSlotModel {
	String? date;
	String? time;
	String? payedAmount;

	BookSlotModel({this.date, this.time, this.payedAmount});

	factory BookSlotModel.fromJson(Map<String, dynamic> json) => BookSlotModel(
				date: json['date'] as String?,
				time: json['time'] as String?,
				payedAmount: json['payed_amount'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'date': date,
				'time': time,
				'payed_amount': payedAmount,
			};
}
