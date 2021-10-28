import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/screens/doctor_screens/patientsListScreen.dart';
import 'package:hackathon/screens/patient_screens/myDoctorScreen.dart';
import 'package:hackathon/screens/patient_screens/profileScreen.dart';
import 'package:hackathon/screens/patient_screens/schemesData.dart';
import 'package:hackathon/screens/patient_screens/serviceScreen.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                  (route) => true);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                size: width * 0.08,
              ),
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
            onTap: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              // ignore: non_constant_identifier_names
              final doctor_check = sharedPreferences.getInt('doctor_check');
              final snackBar = SnackBar(
                content: const Text('You are not a patient'),
              );

              doctor_check == 200
                  ? ScaffoldMessenger.of(context).showSnackBar(snackBar)
                  : Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceScreen(),
                      ),
                      (route) => true,
                    );
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
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => My_doctor(),
                ),
                (route) => true,
              );
            },
            child: Container(
              width: width,
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
                      child: Image.asset(
                        "assets/images/stethoscope1.png",
                        width: width * 0.5,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  Text("My Doctor",
                      style: TextStyle(
                        fontFamily: "PTSans",
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.075,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientsList(),
                ),
                (route) => true,
              );
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
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SchemesData()),
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
                      color: Color(0xffD2EEBD)),
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
          BottomNavigation()
        ],
      ),
    );
  }
}
