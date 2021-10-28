import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:hackathon/widgets/ratingvalue.dart';

class ViewRatings extends StatefulWidget {
  const ViewRatings({Key? key}) : super(key: key);

  @override
  _ViewRatingsState createState() => _ViewRatingsState();
}

class _ViewRatingsState extends State<ViewRatings> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.93,
            width: width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset(
                    "assets/images/backGround1.png",
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
                  top: height * 0.02,
                  left: width * 0.37,
                  child: Column(
                    children: [
                      Text(
                        "View",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.073,
                            color: Colors.white),
                      ),
                      Text(
                        "Details",
                        style: TextStyle(
                            fontFamily: "poppins",
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
                Positioned(
                  top: height * 0.25,
                  child: Container(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/heartRate.png"),
                        Image.asset("assets/images/liverRate.png"),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.3,
                  left: width * 0.19,
                  child: RatingValue(),
                ),
                Positioned(
                  top: height * 0.3,
                  right: width * 0.19,
                  child: RatingValue(),
                ),
                Positioned(
                  top: height * 0.5,
                  child: Container(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/kidneyRate.png"),
                        Image.asset("assets/images/sugarRate.png"),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.55,
                  left: width * 0.19,
                  child: RatingValue(),
                ),
                Positioned(
                  top: height * 0.55,
                  right: width * 0.19,
                  child: RatingValue(),
                ),
                Positioned(
                  top: height * 0.72,
                  child: Image.asset("assets/images/sugarRate.png"),
                ),
                Positioned(
                  top: height * 0.77,
                  child: RatingValue(),
                ),
              ],
            ),
          ),
          BottomNavigation()
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------
class ViewDetails extends StatefulWidget {
  ViewDetails({Key? key, required this.percentage, required this.disease})
      : super(key: key);
  String percentage;
  String disease;
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
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
            height: height * 0.93,
            child: ListView.builder(itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    Container(
                      height: height * 0.3,
                      width: width,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            child: Image.asset(
                              "assets/images/backGround1.png",
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
                              icon:
                                  Image.asset("assets/images/notification.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "You have ${widget.percentage}%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w800,
                        fontSize: width * 0.065,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "chances of getting",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w800,
                        fontSize: width * 0.065,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${widget.disease} disease",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w800,
                        fontSize: width * 0.065,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "*based on the reports you have uploaded (or the values you have entered)",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.025,
                          fontFamily: "PTSans"),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Recommended Doctors",
                          style: TextStyle(
                              fontFamily: "PTSans",
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                );
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Container(
                  height: height * 0.13,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3E000000),
                          blurRadius: 3,
                        )
                      ],
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      Container(
                        height: height * 0.13,
                        width: width * 0.24,
                        decoration: BoxDecoration(
                          color: Color(0xffc4c4c4),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Doctor $index",
                                  style: GoogleFonts.ptSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.065),
                                ),
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    "Details: ",
                                    style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.w800,
                                        fontSize: width * 0.027),
                                  ),
                                  Text(
                                    "lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lore....",
                                    style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width * 0.025),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
          BottomNavigation(),
        ],
      ),
    );
  }
}
