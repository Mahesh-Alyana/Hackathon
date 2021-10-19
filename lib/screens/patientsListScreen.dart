import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/providers/patientList_provider.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:provider/provider.dart';

class PatientsList extends StatefulWidget {
  const PatientsList({Key? key}) : super(key: key);

  @override
  State<PatientsList> createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  var _init = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<PatientList_provider>(context).getPatientList().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    final patientData = Provider.of<PatientList_provider>(context);

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
        children: [
          Container(
            height: height * 0.8,
            child: ListView.builder(
                itemCount: patientData.patientList.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Patients",
                              style: TextStyle(
                                  fontFamily: "playfairdisplay",
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 0.09,
                                  color: Colors.black),
                            ),
                            Icon(
                              Icons.filter_alt_outlined,
                              size: width * 0.1,
                              color: Color(0xff2384A4),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
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
                                      "${patientData.patientList[index].patientName}",
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
                                        "Date:${patientData.patientList[index].date}\nTimeslot:${patientData.patientList[index].timeSlot}",
                                        style: GoogleFonts.ptSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.025),
                                        maxLines: 3,
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
          BottomNavigation()
        ],
      ),
    );
  }
}
