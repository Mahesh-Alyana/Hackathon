import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/models/patient.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class PatientList_provider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late List<Patient> _patientList = [];

  List<Patient> get patientList {
    return [..._patientList];
  }

  Future<void> getPatientList() async {
    String url = "${ApiConfig.host}doctors/patents/";
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'JWT$obtainedToken',
      });
      print(response);
      print(response.statusCode);
      List<Patient> patientList = [];

      final responseData = json.decode(response.body);
      // ignore: non_constant_identifier_names
      final responseData_patient =
          json.decode(responseData['patient']) as List<dynamic>;
      // print(responseData);
      for (int i = 0; i < responseData.length; i++) {
        Patient repo = Patient(
          patientName: responseData_patient[i]['patient_name'],
          date: responseData_patient[i]['date'],
          timeSlot: responseData_patient[i]['time_slot'],
        );

        patientList.add(repo);
      }

      _patientList = patientList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
