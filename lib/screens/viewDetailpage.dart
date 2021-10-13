import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';

class ViewDeatailScreen extends StatefulWidget {
  const ViewDeatailScreen({Key? key}) : super(key: key);

  @override
  _ViewDeatailScreenState createState() => _ViewDeatailScreenState();
}

class _ViewDeatailScreenState extends State<ViewDeatailScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.47,
            width: width,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset(
                    "assets/images/backGround.png",
                    width: width,
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Image.asset(
                    "assets/images/topBar.png",
                    width: width,
                  ),
                ),
                Positioned(
                  top: height * 0.055,
                  child: Image.asset(
                    "assets/images/bag.png",
                    width: width,
                  ),
                ),
                Positioned(
                  top: height * 0.02,
                  left: width * 0.37,
                  child: Column(
                    children: [
                      Text(
                        "View",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.073,
                            color: Colors.white),
                      ),
                      Text(
                        "Details",
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
                ),
              ],
            ),
          ),
          Text(
            " General Physician",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: width * 0.085,
            ),
          ),
          Text(
            "Absolute option for unexpected",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: width * 0.03,
                color: Color(0xA4000000)),
          ),
          Text(
            "problems with exprert advice.",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: width * 0.03,
                color: Color(0xA4000000)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 5, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "About",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.06,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              "I used to think eye masks were only for flights, but Buki changed that. With their unique collagen fabric, this eye mask takes it to the next level. Put it on for a quick power nap, or just sleep in it overnight - you’ll wake up feeling energized and refreshed. I can confirm that it works better than coffee. It almost feels like someone is gently massaging your eyes while you relax. What’s better than that? ",
              style: GoogleFonts.fjordOne(
                fontSize: width * 0.035,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: height * 0.06,
              width: width * 0.52,
              decoration: BoxDecoration(
                  color: Color(0xff24a0a8),
                  borderRadius: BorderRadius.circular(8)),
              child: MaterialButton(
                onPressed: () {},
                child: Center(
                  child: Text(
                    "Book Slot",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.055,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: BottomNavigation(),
          ),
        ],
      ),
    );
  }
}
