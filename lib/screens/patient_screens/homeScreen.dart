import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/screens/doctor_screens/patientsListScreen.dart';
import 'package:hackathon/screens/patient_screens/serviceScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.06,
        backgroundColor: Color(0xff2384A4),
        centerTitle: true,
        title: Text(
          "Heal Upp",
          style: TextStyle(
              fontFamily: "PTsans",
              fontSize: width * 0.075,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              size: width * 0.08,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceScreen(),
                  ),
                  (route) => true);
            },
            child: Row(
              children: [
                SizedBox(width: width * 0.05),
                Container(
                  height: height * 0.15,
                  width: height * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xfffed008)),
                  child: Center(
                    child: Image.asset("assets/images/service_.png"),
                  ),
                ),
                SizedBox(width: width * 0.04),
                Text("Services",
                    style: TextStyle(
                      fontFamily: "PTSans",
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.075,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(width: width * 0.05),
                Container(
                  height: height * 0.15,
                  width: height * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFB8B8)),
                  child: Center(
                    child: Image.asset("assets/images/reports_.png"),
                  ),
                ),
                SizedBox(width: width * 0.04),
                Text("Reports",
                    style: TextStyle(
                      fontFamily: "PTSans",
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.075,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(width: width * 0.05),
                Container(
                  height: height * 0.15,
                  width: height * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff3DCDCD)),
                  child: Center(
                    child: Image.asset("assets/images/test_.png"),
                  ),
                ),
                SizedBox(width: width * 0.04),
                Text("Test",
                    style: TextStyle(
                      fontFamily: "PTSans",
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.075,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PatientsList()),
                  (route) => false);
            },
            child: Row(
              children: [
                SizedBox(width: width * 0.05),
                Container(
                  height: height * 0.15,
                  width: height * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffCFD8DC)),
                  child: Center(
                    child: Image.asset("assets/images/appointments_.png"),
                  ),
                ),
                SizedBox(width: width * 0.04),
                Text("Appointments ",
                    style: TextStyle(
                      fontFamily: "PTSans",
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.075,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(width: width * 0.05),
                Container(
                  height: height * 0.15,
                  width: height * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xfffed008)),
                  child: Center(
                    child: Image.asset("assets/images/schemes_.png"),
                  ),
                ),
                SizedBox(width: width * 0.04),
                Text("Schemes",
                    style: TextStyle(
                      fontFamily: "PTSans",
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.075,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
