import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/models/slot_model.dart';
import 'package:hackathon/models/timeslota.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class SlotList_provider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late List<SlotModel> _slotList = [];
  late List<List<Timeslota>> _timeSlotList = [];

  List<SlotModel> get slotList {
    return [..._slotList];
  }

  List<List<Timeslota>> get timeslot {
    return [..._timeSlotList];
  }

  Future<void> getSlotList(String slug) async {
    String url = "${ApiConfig.host}main/get_slots/$slug";

    try {
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);
      print(response.body);
      List<SlotModel> slotList = [];
      List<List<Timeslota>> timeSlotList = [];

      final responseData = json.decode(response.body) as List<dynamic>;
      print(responseData[0]);
      for (int i = 0; i < responseData.length; i++) {
        // ignore: non_constant_identifier_names
        final responseData_timeSlot =
            responseData[i]['timeslotas'] as List<dynamic>;
        print(responseData_timeSlot);
        SlotModel slots = SlotModel(
          date: responseData[i]["date"],
        );
        for (int j = 0; j < responseData_timeSlot[i].length; j++) {
          Timeslota timeSlots =
              Timeslota(times: responseData_timeSlot[j]['times']);
          print(responseData_timeSlot[j]['times']);
          timeSlotList[i].add(timeSlots);
          // print(timeSlotList[j]);
        }
        slotList.add(slots);
      }
      _slotList = slotList;
      _timeSlotList = timeSlotList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
