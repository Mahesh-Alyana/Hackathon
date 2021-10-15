import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  bool _isAppointment = true;
  bool _isUpcoming = false;
  void _appointment() {
    setState(() {
      if (_isAppointment == false) {
        _isAppointment = true;
        _isUpcoming = false;
      }
    });
  }

  void _upcoming() {
    setState(() {
      if (_isUpcoming == false) {
        _isAppointment = false;
        _isUpcoming = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.055,
        width: width * 0.79,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffc4c4c4),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => _appointment(),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: height * 0.045,
                      width: width * 0.38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          _isAppointment == true ? "        " : "Appointments",
                          style: TextStyle(
                            color: Color(0xff7A7585),
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _upcoming(),
                  child: Container(
                    height: height * 0.045,
                    width: width * 0.38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        _isUpcoming == true ? "        " : "Upcoming",
                        style: TextStyle(
                          color: Color(0xff7A7585),
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: AnimatedAlign(
                alignment: _isAppointment == true
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: Duration(milliseconds: 200),
                child: Container(
                  height: height * 0.045,
                  width: width * 0.38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF000000),
                  ),
                  child: Center(
                      child: Text(
                    _isAppointment == true ? "Appointments" : "Upcoming",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.04,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
