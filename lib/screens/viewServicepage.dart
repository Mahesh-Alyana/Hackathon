import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/screens/slotBookingScreen.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';

// ignore: must_be_immutable
class ViewServiceScreen extends StatefulWidget {
  ViewServiceScreen({
    Key? key,
    required this.serviceName,
    required this.description,
    required this.image,
    required this.slug,
    required this.cost,
  }) : super(key: key);
  String serviceName;
  String description;
  String image;
  String slug;
  String cost;

  @override
  _ViewServiceScreenState createState() => _ViewServiceScreenState();
}

class _ViewServiceScreenState extends State<ViewServiceScreen> {
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.network(
                    "${widget.image}",
                    width: width * 0.5,
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
            "${widget.serviceName}",
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
              "${widget.description}",
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
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SlotBookingScreen(
                                slug: widget.slug,
                                cost: widget.cost,
                              )),
                      (route) => true);
                },
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
          BottomNavigation(),
        ],
      ),
    );
  }
}
