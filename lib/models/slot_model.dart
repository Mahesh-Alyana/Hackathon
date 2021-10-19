class SlotModel {
  String? timeslot;
  String? date;

  SlotModel({this.timeslot, this.date});

  factory SlotModel.fromJson(Map<String, dynamic> json) => SlotModel(
        timeslot: json['timeslot'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'timeslot': timeslot,
        'date': date,
      };
}
