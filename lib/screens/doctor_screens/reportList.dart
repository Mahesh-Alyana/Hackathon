import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/providers/report_list_provider.dart';
import 'package:hackathon/screens/doctor_screens/reportUpload.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class ReportList_P extends StatefulWidget {
  const ReportList_P({Key? key}) : super(key: key);

  @override
  _ReportList_PState createState() => _ReportList_PState();
}

// ignore: camel_case_types
class _ReportList_PState extends State<ReportList_P> {
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
            height: height * 0.8655,
            child: ListView.builder(itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reports",
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
                                  "Test $index",
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

// ignore: camel_case_types
class ReportList_D extends StatefulWidget {
  ReportList_D({
    Key? key,
    required this.patient_name,
    required this.date,
    required this.time,
  }) : super(key: key);
  String patient_name;
  String date;
  String time;

  @override
  _ReportList_DState createState() => _ReportList_DState();
}

// ignore: camel_case_types
class _ReportList_DState extends State<ReportList_D> {
  var _init = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<ReportList_provider>(context)
          .getReportList(widget.patient_name.split(' ')[0])
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    final reportData = Provider.of<ReportList_provider>(context);

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
                itemCount: reportData.reportList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width,
                        child: Column(
                          children: [
                            Container(
                              width: width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Reports",
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
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${widget.patient_name}",
                                style: GoogleFonts.ptSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.05),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: [
                                  Text(
                                    "Details: ",
                                    style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.w800,
                                        fontSize: width * 0.027),
                                  ),
                                  Container(
                                    width: width * 0.5,
                                    child: Text(
                                      "Date:${widget.date}\nTimeslot:${widget.time}",
                                      style: GoogleFonts.ptSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width * 0.025),
                                      maxLines: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Reports",
                                    style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width * 0.05),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReportUpload_D()),
                                            (route) => true);
                                      },
                                      child: Icon(Icons.add)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return _isLoading
                      ? CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: height * 0.8,
                                        width: width * 0.9,
                                        child: Image.network(
                                          '${reportData.reportList[index - 1].image!.split('?')[0]}',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      MaterialButton(
                                          minWidth: width * 0.5,
                                          color: Color(0xff2384A4),
                                          child: Center(
                                            child: Text(
                                              "Go Back",
                                              style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "PTSans",
                                                  color: Colors.white),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          })
                                    ],
                                  );
                                });
                          },
                          child: Padding(
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
                                    child: Image.network(
                                      '${reportData.reportList[index - 1].image!.split('?')[0]}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: width * 0.6,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${reportData.reportList[index - 1].name}",
                                              style: GoogleFonts.ptSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width * 0.065),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  "Details: ",
                                                  style: GoogleFonts.ptSans(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: width * 0.027),
                                                ),
                                                Text(
                                                  "${reportData.reportList[index - 1].description}",
                                                  style: GoogleFonts.ptSans(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: width * 0.025),
                                                  maxLines: 3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
