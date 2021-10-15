import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon/screens/calenderView.dart';
import 'package:hackathon/screens/loginScreen.dart';
import 'package:hackathon/screens/patientsListScreen.dart';
import 'package:hackathon/screens/reportList.dart';
import 'package:hackathon/screens/reportUpload.dart';
import 'package:hackathon/screens/schemesData.dart';
import 'package:hackathon/screens/serviceScreen.dart';
import 'package:hackathon/screens/signUpScreen.dart';
import 'package:hackathon/screens/viewDetailspage.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalToken;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    finalToken = obtainedToken;
  }

  void initState() {
    getToken();
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: finalToken == null ? SignUpScreen() : ServiceScreen(),
    );
  }
}
