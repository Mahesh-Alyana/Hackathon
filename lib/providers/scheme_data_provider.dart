import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/models/scheme_data.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class SchemeList_provider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late List<SchemeDataModel> _schemeList = [];

  List<SchemeDataModel> get schemeList {
    return [..._schemeList];
  }

  Future<void> getSchemeList() async {
    String url = "${ApiConfig.host}main/Schemes/ ";

    try {
      final response = await http.get(Uri.parse(url));
      print(response);
      List<SchemeDataModel> schemeList = [];

      final responseData = json.decode(response.body) as List<dynamic>;

      for (int i = 0; i < responseData.length; i++) {
        SchemeDataModel repo = SchemeDataModel(
          name: responseData[i]["name"],
          description: responseData[i]['description'],
          elibleAge: responseData[i]['elible_age'],
          categortyElible: responseData[i]['categorty_elible'],
          lastDateEligble: responseData[i]['last_Date_eligble'],
        );

        schemeList.add(repo);
      }

      _schemeList = schemeList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
