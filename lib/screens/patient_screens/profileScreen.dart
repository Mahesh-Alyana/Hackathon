import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/screens/loginScreen.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.137,
            width: width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset(
                    "assets/images/topBar1.png",
                    width: width,
                  ),
                ),
                Positioned(
                  top: height * 0.015,
                  child: Column(
                    children: [
                      Text(
                        "Profile",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.073,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: width * 0.84,
                  top: height * 0.015,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/notification.png"),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          CircleAvatar(
            maxRadius: width * 0.15,
            child: Image.asset("assets/images/profilepic.png"),
          ),
          Divider(),
          Text(
            "Samantha",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: width * 0.075),
          ),
          Text(
            "DOB: 29-01-2002",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: width * 0.05,
                color: Color(0xA90000000)),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Appointments",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.065,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.12,
                  width: height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x480000000),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/bag.png",
                        width: width * 0.09,
                      ),
                      Text(
                        "General Physician",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.035,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.12,
                  width: height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x480000000),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/eye.png",
                        width: width * 0.09,
                      ),
                      Text(
                        "Eye Physician",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.035,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.12,
                  width: height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x480000000),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/heart.png",
                        width: width * 0.09,
                      ),
                      Text(
                        "Heart Specialist",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.035,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(height: height * 0.025),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Report",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.065,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.12,
                  width: height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x480000000),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/bag.png",
                        width: width * 0.09,
                      ),
                      Text(
                        "General Physician",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.035,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.12,
                  width: height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x480000000),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/eye.png",
                        width: width * 0.09,
                      ),
                      Text(
                        "Eye Physician",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.035,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.12,
                  width: height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x480000000),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/heart.png",
                        width: width * 0.09,
                      ),
                      Text(
                        "Heart Specialist",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.035,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 0.06,
              width: width * 0.52,
              decoration: BoxDecoration(
                  color: Color(0xff24a0a8),
                  borderRadius: BorderRadius.circular(8)),
              child: MaterialButton(
                onPressed: () {
                  Future getToken() async {
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.remove('token');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }

                  getToken();
                },
                child: Center(
                  child: Text(
                    "Log Out",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.055,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          BottomNavigation(),
        ],
      ),
    );
  }
}
