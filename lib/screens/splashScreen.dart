import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackathon/screens/homeScreen.dart';
import 'package:hackathon/screens/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalToken;
// ignore: non_constant_identifier_names
int? doctor_check;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    getToken().whenComplete(() async {
      Timer(
        Duration(seconds: 2),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    finalToken == null ? LoginScreen() : HomeScreen()),
            (route) => false),
      );
    });

    super.initState();
  }

  Future getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    finalToken = obtainedToken;
    doctor_check = sharedPreferences.getInt('doctor_check');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
