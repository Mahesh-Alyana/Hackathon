import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon/providers/patientList_provider.dart';
import 'package:hackathon/providers/recommended_schemes_provider.dart';
import 'package:hackathon/providers/report_list_provider.dart';
import 'package:hackathon/providers/scheme_data_provider.dart';
import 'package:hackathon/providers/service_provider.dart';
import 'package:hackathon/providers/slot_provider.dart';
import 'package:hackathon/screens/splashScreen.dart';
import 'package:provider/provider.dart';

String? finalToken;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    // ignore: deprecated_member_use
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ServiceList_provider()),
        ChangeNotifierProvider.value(value: SlotList_provider()),
        ChangeNotifierProvider.value(value: PatientList_provider()),
        ChangeNotifierProvider.value(value: ReportList_provider()),
        ChangeNotifierProvider.value(value: SchemeList_provider()),
        ChangeNotifierProvider.value(value: RecommendedSchemeList_provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
