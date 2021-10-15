import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:hackathon/widgets/navigationBar.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: camel_case_types
class CalenderView_D extends StatefulWidget {
  const CalenderView_D({Key? key}) : super(key: key);

  @override
  _CalenderView_DState createState() => _CalenderView_DState();
}

// ignore: camel_case_types
class _CalenderView_DState extends State<CalenderView_D> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
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
                  style: TextStyle(
                      fontFamily: "PTSans",
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
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Appointments",
                style: TextStyle(
                    fontFamily: "playfairdisplay",
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.09,
                    color: Colors.black),
              ),
            ),
          ),
          NavigationBar(),
          Container(
            height: height * 0.38,
            width: width * 0.79,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x5D000000),
                    blurRadius: 2,
                  ),
                ]),
            child: Center(
              child: TableCalendar(
                rowHeight: height * 0.048,
                focusedDay: selectedDay,
                firstDay: DateTime(1990),
                lastDay: DateTime(2050),
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,

                //Day Changed
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },

                //To style the Calendar
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: true,
                  weekendTextStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: width * 0.03,
                  ),
                  defaultTextStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: width * 0.03,
                  ),
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xff2384A4)),
                    color: Color(0xFF000000),
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: TextStyle(color: Color(0xff2384A4)),
                  selectedTextStyle: TextStyle(color: Color(0xff2384A4)),
                  todayDecoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xff2384A4)),
                    color: Color(0xFF000000),
                    shape: BoxShape.circle,
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),

                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.04,
                  ),
                  leftChevronPadding: EdgeInsets.only(left: 70),
                  rightChevronPadding: EdgeInsets.only(right: 70),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
            ),
          ),
          Divider(),
          Container(
            height: height * 0.08,
            width: width * 0.79,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF000000),
              border: Border.all(
                width: 1,
                color: Color(0xFF000000),
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
                        color: Color(0xffffffff)),
                  ),
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(45 / 360),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.navigation_outlined,
                      color: Color(0xFF2384A4),
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
              color: Color(0xFF000000),
              border: Border.all(
                width: 1,
                color: Color(0xFF000000),
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
                    "May, 2 — May, 21",
                    style: GoogleFonts.ibmPlexSans(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.calendar_today,
                      color: Color(0xFF2384A4),
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
              color: Color(0xFF000000),
              border: Border.all(
                width: 1,
                color: Color(0xFF000000),
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
                    "Doctor's name",
                    style: GoogleFonts.ibmPlexSans(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFF2384A4),
                    size: width * 0.09,
                  ),
                )
              ],
            ),
          ),
          BottomNavigation(),
        ],
      ),
    );
  }
}
