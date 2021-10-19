import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/models/slot_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class SlotList_provider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late List<SlotModel> _slotList = [];

  List<SlotModel> get slotList {
    return [..._slotList];
  }

  Future<void> getSlotList(String slug) async {
    String url = "${ApiConfig.host}main/get_slots/$slug/";

    try {
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);
      print(response);
      List<SlotModel> slotList = [];

      final responseData = json.decode(response.body) as List<dynamic>;

      for (int i = 0; i < responseData.length; i++) {
        SlotModel repo = SlotModel(
            date: responseData[i]["date"],
            timeslot: responseData[i]["timeslot"]);
        slotList.add(repo);
      }
      _slotList = slotList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
