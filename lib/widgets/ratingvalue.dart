import 'package:flutter/material.dart';

class RatingValue extends StatelessWidget {
  const RatingValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: width * 0.17,
      width: width * 0.17,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x86C4C4C4),
        boxShadow: [
          BoxShadow(
            color: Color(0x27000000),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "50%",
          style: TextStyle(
              fontFamily: "poppins",
              fontWeight: FontWeight.w700,
              fontSize: width * 0.065),
        ),
      ),
    );
  }
}
