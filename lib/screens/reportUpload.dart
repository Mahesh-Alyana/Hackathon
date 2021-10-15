import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';

// ignore: camel_case_types
class ReportUpload_p extends StatefulWidget {
  const ReportUpload_p({Key? key}) : super(key: key);

  @override
  _ReportUpload_pState createState() => _ReportUpload_pState();
}

// ignore: camel_case_types
class _ReportUpload_pState extends State<ReportUpload_p> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.06,
        backgroundColor: Color(0xff2384A4),
        title: Container(
          width: width * 0.23,
          child: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: width * 0.04,
                ),
                Text(
                  "Back",
                  style: GoogleFonts.ptSans(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Upload Reports",
                style: TextStyle(
                    fontFamily: "playfairdisplay",
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.09,
                    color: Colors.black),
              ),
            ),
          ),
          Container(
            height: height * 0.08,
            width: width * 0.79,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffededed),
              border: Border.all(
                width: 1,
                color: Color(0xFFC0C0C0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x31000000),
                  blurRadius: 2,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Patient's name",
                    style: GoogleFonts.ibmPlexSans(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(45 / 360),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.navigation_outlined,
                      color: Color(0xA52384A4),
                      size: width * 0.09,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Container(
            height: height * 0.08,
            width: width * 0.79,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffededed),
              border: Border.all(
                width: 1,
                color: Color(0xFFC0C0C0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x31000000),
                  blurRadius: 2,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Test name",
                    style: GoogleFonts.ibmPlexSans(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      "assets/images/injection.png",
                      width: width * 0.1,
                    ))
              ],
            ),
          ),
          Divider(),
          Container(
            height: height * 0.08,
            width: width * 0.79,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffededed),
              border: Border.all(
                width: 1,
                color: Color(0xFFC0C0C0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x31000000),
                  blurRadius: 2,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Select file",
                    style: GoogleFonts.ibmPlexSans(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.add,
                    color: Color(0xCA2384A4),
                    size: width * 0.09,
                  ),
                )
              ],
            ),
          ),
          BottomNavigation()
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class ReportUpload_D extends StatefulWidget {
  const ReportUpload_D({Key? key}) : super(key: key);

  @override
  _ReportUpload_DState createState() => _ReportUpload_DState();
}

// ignore: camel_case_types
class _ReportUpload_DState extends State<ReportUpload_D> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.06,
        backgroundColor: Color(0xff2384A4),
        title: Container(
          width: width * 0.23,
          child: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: width * 0.04,
                ),
                Text(
                  "Back",
                  style: GoogleFonts.ptSans(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Upload Reports",
                style: TextStyle(
                    fontFamily: "playfairdisplay",
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.09,
                    color: Colors.black),
              ),
            ),
          ),
          Container(
            height: height * 0.08,
            width: width * 0.79,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffededed),
              border: Border.all(
                width: 1,
                color: Color(0xFFC0C0C0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x31000000),
                  blurRadius: 2,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Patient's name",
                    style: GoogleFonts.ibmPlexSans(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(45 / 360),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.navigation_outlined,
                      color: Color(0xB72384A4),
                      size: width * 0.09,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Container(
            height: height * 0.08,
            width: width * 0.79,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffededed),
              border: Border.all(
                width: 1,
                color: Color(0xFFC0C0C0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x31000000),
                  blurRadius: 2,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Test name",
                    style: GoogleFonts.ibmPlexSans(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      "assets/images/injection.png",
                      width: width * 0.1,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Value A",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.06,
                      color: Color(0xff999999)),
                ),
              ),
            ),
          ),
          Divider(),
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Value B",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.06,
                      color: Color(0xff999999)),
                ),
              ),
            ),
          ),
          Divider(),
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Value C",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.06,
                      color: Color(0xff999999)),
                ),
              ),
            ),
          ),
          Divider(),
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Value D",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.06,
                      color: Color(0xff999999)),
                ),
              ),
            ),
          ),
          BottomNavigation()
        ],
      ),
    );
  }
}
