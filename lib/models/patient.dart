class Patient {
  String? patientName;
  int? serviceP;
  String? date;
  bool? payment;
  String? timeSlot;
  int? payedAmount;
  int? patient;

  Patient({
    this.patientName,
    this.serviceP,
    this.date,
    this.payment,
    this.timeSlot,
    this.payedAmount,
    this.patient,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        patientName: json['patient_name'] as String?,
        serviceP: json['service_p'] as int?,
        date: json['date'] as String?,
        payment: json['payment'] as bool?,
        timeSlot: json['time_slot'] as String?,
        payedAmount: json['payed_amount'] as int?,
        patient: json['patient'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'patient_name': patientName,
        'service_p': serviceP,
        'date': date,
        'payment': payment,
        'time_slot': timeSlot,
        'payed_amount': payedAmount,
        'patient': patient,
      };
}
