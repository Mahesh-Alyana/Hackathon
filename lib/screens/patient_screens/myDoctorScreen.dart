import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/screens/patient_screens/viewDetailspage.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:hackathon/widgets/top_bar.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class My_doctor extends StatefulWidget {
  const My_doctor({Key? key}) : super(key: key);

  @override
  _My_doctorState createState() => _My_doctorState();
}

// ignore: camel_case_types
class _My_doctorState extends State<My_doctor> {
  Future<void> getreport(
    String endPoint,
    String k1,
    String k2,
    String k3,
    String k4,
    String k5,
    String k6,
    String k7,
    String v1,
    String v2,
    String v3,
    String v4,
    String v5,
    String v6,
    String v7,
  ) async {
    final responseModel = {
      k1: v1,
      k2: v2,
      k3: v3,
      k4: v4,
      k5: v5,
      k6: v6,
      k7: v7,
    };
    String url = "${ApiConfig.host}main/$endPoint/";
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(responseModel),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(responseModel);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ViewDetails(
                  percentage: "0", disease: dropdownValue.split("_")[0])),
          (route) => true);
    } else if (response.statusCode == 400) {
      print(response.body);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ViewDetails(
                  percentage: "100", disease: dropdownValue.split("_")[0])),
          (route) => true);
    }
  }

  TextEditingController v1 = TextEditingController();
  TextEditingController v2 = TextEditingController();
  TextEditingController v3 = TextEditingController();
  TextEditingController v4 = TextEditingController();
  TextEditingController v5 = TextEditingController();
  TextEditingController v6 = TextEditingController();
  TextEditingController v7 = TextEditingController();
  String dropdownValue = 'Heart_prediction';
  final forms = {
    'Heart_prediction': [
      'cp',
      'testbps',
      'chol',
      'fbps',
      'restecg',
      'thalach',
      'exang',
    ],
    'kidney_prediction': [
      'bp',
      'sg',
      'al',
      'sl',
      'rbc',
      'pc',
      'pcc',
    ],
    'diabatics_prediction': [
      'Pregnancies',
      'Glucose',
      'BloodPressure',
      'BMI',
      'DiabetesPedigreeFunction',
      'Age',
      'exang',
    ],
    'liver_prediction': [
      'Total Bilirubin',
      'Direct_Bilirubin',
      'Alkaline_Phosphotase',
      'Alamine_Aminotransferase',
      'Total_Protiens',
      'Albumin',
      'Albumin_and_Globulin_Ratio',
    ]
  };
  // ignore: non_constant_identifier_names
  List from_state = [1, 2, 3, 4, 5, 6, 7];

  // ignore: non_constant_identifier_names
  List<String> PredictorName = [
    'Heart_prediction',
    'kidney_prediction',
    'diabatics_prediction',
    'liver_prediction',
  ];

  int i = 0;
  void initState() {
    for (i = 0; i < 7; i++) {
      from_state[i] = forms["$dropdownValue"]![i];
    }
    super.initState();
  }

  void getDropDownItem() {
    setState(() {
      for (i = 0; i < 7; i++) {
        from_state[i] = forms["$dropdownValue"]![i];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Doctor",
                          style: TextStyle(
                              fontFamily: "playfairdisplay",
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.09,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.red, fontSize: 18),
                      underline: Container(
                        height: 2,
                        color: Color(0xff2384A4),
                      ),
                      onChanged: (String? data) {
                        setState(() {
                          dropdownValue = data!;
                          getDropDownItem();
                        });
                      },
                      items: PredictorName.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: Color(0x45000000), blurRadius: 2),
                    ],
                  ),
                  child: TextFormField(
                    controller: v1,
                    decoration: InputDecoration(
                      hintText: '${from_state[0]}',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.06,
                        color: Color(0xff999999),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: Color(0x45000000), blurRadius: 2),
                    ],
                  ),
                  child: TextFormField(
                    controller: v2,
                    decoration: InputDecoration(
                      hintText: '${from_state[1]}',
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.06,
                          color: Color(0xff999999)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: Color(0x45000000), blurRadius: 2),
                    ],
                  ),
                  child: TextFormField(
                    controller: v3,
                    decoration: InputDecoration(
                      hintText: '${from_state[2]}',
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.06,
                          color: Color(0xff999999)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: Color(0x45000000), blurRadius: 2),
                    ],
                  ),
                  child: TextFormField(
                    controller: v4,
                    decoration: InputDecoration(
                      hintText: '${from_state[3]}',
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.06,
                          color: Color(0xff999999)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: Color(0x45000000), blurRadius: 2),
                    ],
                  ),
                  child: TextFormField(
                    controller: v5,
                    decoration: InputDecoration(
                      hintText: '${from_state[4]}',
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.06,
                          color: Color(0xff999999)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: Color(0x45000000), blurRadius: 2),
                    ],
                  ),
                  child: TextFormField(
                    controller: v6,
                    decoration: InputDecoration(
                      hintText: '${from_state[5]}',
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.06,
                          color: Color(0xff999999)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: Color(0x45000000), blurRadius: 2),
                    ],
                  ),
                  child: TextFormField(
                    controller: v7,
                    decoration: InputDecoration(
                      hintText: '${from_state[6]}',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.06,
                        color: Color(0xff999999),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: Color(0xff2384A4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      getreport(
                        '$dropdownValue',
                        '${from_state[0]}',
                        '${from_state[1]}',
                        '${from_state[2]}',
                        '${from_state[3]}',
                        '${from_state[4]}',
                        '${from_state[5]}',
                        '${from_state[6]}',
                        '${v1.text}',
                        '${v2.text}',
                        '${v3.text}',
                        '${v4.text}',
                        '${v5.text}',
                        '${v6.text}',
                        '${v7.text}',
                      );
                    },
                    child: Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
                BottomNavigation()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
