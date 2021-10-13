import 'package:flutter/material.dart';
import 'package:hackathon/screens/loginScreen.dart';
import 'package:hackathon/screens/signUpScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SignUpScreen(),
    );
  }
}
