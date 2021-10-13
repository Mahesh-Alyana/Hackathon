import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/screens/viewDetailpage.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/topBar1.png",
                width: width,
              ),
              Positioned(
                top: height * 0.015,
                child: Column(
                  children: [
                    Text(
                      "Services",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.073,
                          color: Colors.white),
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
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ViewDeatailScreen()),
                  (route) => true);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.175,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Color(0xffF8FDFF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: width * 0.01, color: Color(0xff7A9AA7)),
                    boxShadow: [
                      BoxShadow(color: Colors.black54, blurRadius: width * 0.01)
                    ]),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("General Physician",
                              style: TextStyle(
                                  color: Color(0xff39464E),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset("assets/images/triangle1.png")),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            //  height: height*0.1,
                            width: width * 0.5,
                            child: Text(
                              "I used to think eye masks were only for flights, but Buki changed that. With their unique collagen fabric, this eye mask takes it to the next level. Put it on for a quick power nap, or just sleep in it overnight - you’ll wake up feeling energized and refreshed. I can confirm that it works better than coffee. It almost feels like someone is gently massaging your eyes while you relax. What’s better than that? ",
                              style: GoogleFonts.fjordOne(
                                color: Color(0xff39464E),
                                fontSize: width * 0.02,
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          "assets/images/bag.png",
                          width: width * 0.24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ViewDeatailScreen()),
                  (route) => true);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.175,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Color(0xffF8FDFF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: width * 0.01, color: Color(0xff7A9AA7)),
                    boxShadow: [
                      BoxShadow(color: Colors.black54, blurRadius: width * 0.01)
                    ]),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Eye Specialist",
                              style: TextStyle(
                                  color: Color(0xff39464E),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset("assets/images/triangle2.png")),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            //  height: height*0.1,
                            width: width * 0.5,
                            child: Text(
                              "I used to think eye masks were only for flights, but Buki changed that. With their unique collagen fabric, this eye mask takes it to the next level. Put it on for a quick power nap, or just sleep in it overnight - you’ll wake up feeling energized and refreshed. I can confirm that it works better than coffee. It almost feels like someone is gently massaging your eyes while you relax. What’s better than that? ",
                              style: GoogleFonts.fjordOne(
                                color: Color(0xff39464E),
                                fontSize: width * 0.02,
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          "assets/images/eye.png",
                          width: width * 0.24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ViewDeatailScreen()),
                  (route) => true);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.175,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Color(0xffF8FDFF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: width * 0.01, color: Color(0xff7A9AA7)),
                    boxShadow: [
                      BoxShadow(color: Colors.black54, blurRadius: width * 0.01)
                    ]),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Heart Specialist",
                              style: TextStyle(
                                  color: Color(0xff39464E),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset("assets/images/triangle3.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            //  height: height*0.1,
                            width: width * 0.5,
                            child: Text(
                              "I used to think eye masks were only for flights, but Buki changed that. With their unique collagen fabric, this eye mask takes it to the next level. Put it on for a quick power nap, or just sleep in it overnight - you’ll wake up feeling energized and refreshed. I can confirm that it works better than coffee. It almost feels like someone is gently massaging your eyes while you relax. What’s better than that? ",
                              style: GoogleFonts.fjordOne(
                                color: Color(0xff39464E),
                                fontSize: width * 0.02,
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          "assets/images/heart.png",
                          width: width * 0.24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ViewDeatailScreen()),
                  (route) => true);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.175,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Color(0xffF8FDFF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: width * 0.01, color: Color(0xff7A9AA7)),
                    boxShadow: [
                      BoxShadow(color: Colors.black54, blurRadius: width * 0.01)
                    ]),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Skin Specialist",
                              style: TextStyle(
                                  color: Color(0xff39464E),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset("assets/images/triangle4.png")),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            //  height: height*0.1,
                            width: width * 0.5,
                            child: Text(
                              "I used to think eye masks were only for flights, but Buki changed that. With their unique collagen fabric, this eye mask takes it to the next level. Put it on for a quick power nap, or just sleep in it overnight - you’ll wake up feeling energized and refreshed. I can confirm that it works better than coffee. It almost feels like someone is gently massaging your eyes while you relax. What’s better than that? ",
                              style: GoogleFonts.fjordOne(
                                color: Color(0xff39464E),
                                fontSize: width * 0.02,
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          "assets/images/hand.png",
                          width: width * 0.24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomNavigation(),
        ],
      ),
    );
  }
}
