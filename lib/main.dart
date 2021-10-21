import 'package:flutter/material.dart';
import 'package:hackathon/providers/patientList_provider.dart';
import 'package:hackathon/providers/report_list_provider.dart';
import 'package:hackathon/providers/service_provider.dart';
import 'package:hackathon/providers/slot_provider.dart';
import 'package:hackathon/screens/doctor_screens/reportUpload.dart';
import 'package:hackathon/screens/splashScreen.dart';
import 'package:provider/provider.dart';

String? finalToken;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ServiceList_provider()),
        ChangeNotifierProvider.value(value: SlotList_provider()),
        ChangeNotifierProvider.value(value: PatientList_provider()),
        ChangeNotifierProvider.value(value: ReportList_provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
