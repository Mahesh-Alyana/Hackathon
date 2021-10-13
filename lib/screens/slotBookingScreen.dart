import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';

class SlotBookingScreen extends StatefulWidget {
  const SlotBookingScreen({Key? key}) : super(key: key);

  @override
  _SlotBookingScreenState createState() => _SlotBookingScreenState();
}

class _SlotBookingScreenState extends State<SlotBookingScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/topBar.png",
                width: width,
              ),
              Positioned(
                top: height * 0.015,
                child: Column(
                  children: [
                    Text(
                      "Slot",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.073,
                          color: Colors.white),
                    ),
                    Text(
                      "Available",
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
                top: height * 0.03,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/notification.png"),
                ),
              )
            ],
          ),
          Container(
            height: height * 0.75,
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                      "21st June, 2021",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.065,
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.9,
                      child: Wrap(
                        runSpacing: 15,
                        // spacing: 1,
                        children: <Widget>[
                          buttonTime("9:30 AM", Colors.white, Colors.black54),
                          buttonTime("10:30 AM", Colors.white, Colors.black54),
                          buttonTime("12:00 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                        ],
                      ),
                    ),
                    Divider(),
                    Text(
                      "21st June, 2021",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.065,
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.9,
                      child: Wrap(
                        runSpacing: 15,
                        // spacing: 1,
                        children: <Widget>[
                          buttonTime("9:30 AM", Colors.white, Colors.black54),
                          buttonTime("10:30 AM", Colors.white, Colors.black54),
                          buttonTime("12:00 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                        ],
                      ),
                    ),
                    Divider(),
                    Text(
                      "21st June, 2021",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.065,
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.9,
                      child: Wrap(
                        runSpacing: 15,
                        // spacing: 1,
                        children: <Widget>[
                          buttonTime("9:30 AM", Colors.white, Colors.black54),
                          buttonTime("10:30 AM", Colors.white, Colors.black54),
                          buttonTime("12:00 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                        ],
                      ),
                    ),
                    Divider(),
                    Text(
                      "21st June, 2021",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.065,
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.9,
                      child: Wrap(
                        runSpacing: 15,
                        // spacing: 1,
                        children: <Widget>[
                          buttonTime("9:30 AM", Colors.white, Colors.black54),
                          buttonTime("10:30 AM", Colors.white, Colors.black54),
                          buttonTime("12:00 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                        ],
                      ),
                    ),
                    Divider(),
                    Text(
                      "21st June, 2021",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.065,
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.9,
                      child: Wrap(
                        runSpacing: 15,
                        // spacing: 1,
                        children: <Widget>[
                          buttonTime("9:30 AM", Colors.white, Colors.black54),
                          buttonTime("10:30 AM", Colors.white, Colors.black54),
                          buttonTime("12:00 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                        ],
                      ),
                    ),
                    Divider(),
                    Text(
                      "21st June, 2021",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.065,
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.9,
                      child: Wrap(
                        runSpacing: 15,
                        // spacing: 1,
                        children: <Widget>[
                          buttonTime("9:30 AM", Colors.white, Colors.black54),
                          buttonTime("10:30 AM", Colors.white, Colors.black54),
                          buttonTime("12:00 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                        ],
                      ),
                    ),
                    Divider(),
                    Text(
                      "21st June, 2021",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.065,
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.9,
                      child: Wrap(
                        runSpacing: 15,
                        // spacing: 1,
                        children: <Widget>[
                          buttonTime("9:30 AM", Colors.white, Colors.black54),
                          buttonTime("10:30 AM", Colors.white, Colors.black54),
                          buttonTime("12:00 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                        ],
                      ),
                    ),
                    Divider(),
                    Text(
                      "21st June, 2021",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.065,
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.9,
                      child: Wrap(
                        runSpacing: 15,
                        // spacing: 1,
                        children: <Widget>[
                          buttonTime("9:30 AM", Colors.white, Colors.black54),
                          buttonTime("10:30 AM", Colors.white, Colors.black54),
                          buttonTime("12:00 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                          buttonTime("2:00 PM", Colors.white, Colors.black54),
                          buttonTime("5:30 PM", Colors.white, Colors.black54),
                          buttonTime("6:30 PM", Colors.white, Colors.black54),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          BottomNavigation()
        ],
      ),
    );
  }

  Widget buttonTime(timeText, btnBg, timeBtnColor) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.05,
      width: width * 0.3,
      padding: EdgeInsets.symmetric(horizontal: 8),
      // ignore: deprecated_member_use
      child: FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.grey, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8),
          ),
          color: btnBg,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      height: height * 0.36,
                      width: width * 0.756,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/doctor.png"),
                          Text(
                            "Hurry take care..!!",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.065,
                            ),
                          ),
                          Text(
                            "your slot has been booked and",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.035,
                            ),
                          ),
                          Text(
                            "Doctor will contact you at ",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.035,
                            ),
                          ),
                          Text(
                            "29th Januray, 2021; 01:00pm",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.035,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.45,
                              decoration: BoxDecoration(
                                  color: Color(0xff24a0a8),
                                  borderRadius: BorderRadius.circular(8)),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    "Okay",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.055,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Text(timeText,
              style: TextStyle(
                  color: timeBtnColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15))),
    );
  }
}
