import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/models/service_list_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class ServiceList_provider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late List<ServiceListModel> _serviceList = [];

  List<ServiceListModel> get serviceList {
    return [..._serviceList];
  }

  Future<void> getServiceList() async {
    String url = "${ApiConfig.host}main/get_services/";

    try {
      final response = await http.get(Uri.parse(url));
      print(response);
      List<ServiceListModel> serviceList = [];

      final responseData = json.decode(response.body) as List<dynamic>;

      for (int i = 0; i < responseData.length; i++) {
        ServiceListModel repo = ServiceListModel(
          nameOfService: responseData[i]["Name_of_service"],
          images: responseData[i]['images'],
          prizePerSlot: responseData[i]['prize_per_slot'],
          description: responseData[i]['description'],
          slug: responseData[i]["slug"],
        );

        serviceList.add(repo);
      }

      _serviceList = serviceList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
