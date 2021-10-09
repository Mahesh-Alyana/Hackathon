import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.065,
      width: width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, -1),
          color: Color(0xFFC5C5C5),
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: MaterialButton(
              onPressed: () {},
              child: Column(
                children: [
                  Icon(
                    Icons.wallet_giftcard,
                    size: width * 0.05,
                    color: Color(0xFF838383),
                  ),
                  Text(
                    "Offers",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: width * 0.03,
                      color: Color(0xFF707070),
                    ),
                  )
                ],
              ),
            ),
          ),
          Image.asset("assets/images/divider.png"),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: MaterialButton(
              onPressed: () {},
              child: Column(
                children: [
                  Icon(
                    Icons.add,
                    size: width * 0.05,
                    color: Color(0xFF838383),
                  ),
                  Text(
                    "Servies",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: width * 0.03,
                      color: Color(0xFF707070),
                    ),
                  )
                ],
              ),
            ),
          ),
          Image.asset("assets/images/divider.png"),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: MaterialButton(
              onPressed: () {},
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    size: width * 0.05,
                    color: Color(0xFF838383),
                  ),
                  Text(
                    "Profile",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: width * 0.03,
                      color: Color(0xFF707070),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
