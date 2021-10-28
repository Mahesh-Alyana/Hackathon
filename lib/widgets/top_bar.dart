import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.06,
      width: width,
      color: Color(0xff2384A4),
      child: Container(
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
                style: TextStyle(
                    fontFamily: 'PTSans',
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.045,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
