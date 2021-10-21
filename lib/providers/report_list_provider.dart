// ignore: camel_case_types
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/models/report.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ReportList_provider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late List<Report> _ReportList = [];

  List<Report> get reportList {
    return [..._ReportList];
  }

  Future<void> getReportList(String name) async {
    String url = "${ApiConfig.host}doctors/reports/$name/";
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'JWT $obtainedToken',
      });
      print(response);
      print(response.statusCode);
      List<Report> reportList = [];

      final responseData = json.decode(response.body);
      // ignore: non_constant_identifier_names
      final responseData_report = responseData['reports'] as List<dynamic>;
      // print(responseData);
      for (int i = 0; i < responseData_report.length; i++) {
        Report repo = Report(
          name: responseData_report[i]['name'],
          description: responseData_report[i]['description'],
          image: responseData_report[i]['image'],
        );

        reportList.add(repo);
      }

      _ReportList = reportList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
