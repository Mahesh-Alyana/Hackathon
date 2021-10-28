import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/providers/slot_provider.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SlotBookingScreen extends StatefulWidget {
  SlotBookingScreen({Key? key, required this.slug, required this.cost})
      : super(key: key);
  String slug;
  String cost;

  @override
  _SlotBookingScreenState createState() => _SlotBookingScreenState();
}

class _SlotBookingScreenState extends State<SlotBookingScreen> {
  Future<void> bookSlot(String date, String time, String cost) async {
    var formData = FormData.fromMap({
      'date': date,
      'time': time,
      'payed_amount': cost,
    });
    print(formData);

    String url = "${ApiConfig.host}main/process_order/${widget.slug}/";

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    Dio dio = new Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "JWT $obtainedToken";

    Response response = await dio.post(
      url,
      data: formData,
    );
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print(response.statusCode);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(json.decode(response.data)["detail"]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ],
            );
          });

      throw Exception('Failed to load data!');
    }
  }

  var _init = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<SlotList_provider>(context)
          .getSlotList(widget.slug)
          .then((_) {
        setState(() {
          print(widget.slug);

          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    final slotData = Provider.of<SlotList_provider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/topBar.png",
                width: width,
              ),
              Positioned(
                top: height * 0.015,
                child: Column(
                  children: [
                    Text(
                      "Slot",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.073,
                          color: Colors.white),
                    ),
                    Text(
                      "Available",
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
                  onPressed: () {
                    print(slotData.slotList);
                  },
                  icon: Image.asset("assets/images/notification.png"),
                ),
              )
            ],
          ),
          _isLoading
              ? CircularProgressIndicator()
              : slotData.slotList.length == 0
                  ? Center(
                      child: Text('Sorry, no slot available'),
                    )
                  : Container(
                      height: height * 0.75,
                      width: width,
                      child: ListView.builder(
                          itemCount: slotData.slotList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  Text(
                                    "${slotData.slotList[index].date}",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.065,
                                    ),
                                  ),
                                  Divider(),
                                  Container(
                                    alignment: Alignment.center,
                                    width: width * 0.9,
                                    height: height * 0.25,
                                    child: GridView.count(
                                      physics: NeverScrollableScrollPhysics(),
                                      childAspectRatio: 3.0 / 1.0,
                                      crossAxisCount: 3,
                                      children: List.generate(
                                          slotData.timeslot[index].length,
                                          (index1) {
                                        return Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: buttonTime(
                                              "${slotData.timeslot[index][index1].times}",
                                              "${slotData.slotList[index].date}",
                                              "${widget.cost}",
                                              Colors.white,
                                              Colors.black54),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })),
          BottomNavigation()
        ],
      ),
    );
  }

  Widget buttonTime(
    timeText,
    date,
    cost,
    btnBg,
    timeBtnColor,
  ) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.05,
      width: width * 0.3,
      padding: EdgeInsets.symmetric(horizontal: 8),
      // ignore: deprecated_member_use
      child: FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.grey, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8),
          ),
          color: btnBg,
          onPressed: () {
            bookSlot(date, timeText, cost);
            // showDialog(
            //     context: context,
            //     builder: (context) {
            //       return AlertDialog(
            //         content: Container(
            //           height: height * 0.36,
            //           width: width * 0.756,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(11),
            //           ),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Image.asset("assets/images/doctor.png"),
            //               Text(
            //                 "Hurry take care..!!",
            //                 style: GoogleFonts.poppins(
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: width * 0.065,
            //                 ),
            //               ),
            //               Text(
            //                 "your slot has been booked and",
            //                 style: GoogleFonts.poppins(
            //                   fontWeight: FontWeight.w500,
            //                   fontSize: width * 0.035,
            //                 ),
            //               ),
            //               Text(
            //                 "Doctor will contact you at ",
            //                 style: GoogleFonts.poppins(
            //                   fontWeight: FontWeight.w500,
            //                   fontSize: width * 0.035,
            //                 ),
            //               ),
            //               Text(
            //                 "$date, $timeText",
            //                 style: GoogleFonts.poppins(
            //                   fontWeight: FontWeight.w500,
            //                   fontSize: width * 0.035,
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Container(
            //                   height: height * 0.06,
            //                   width: width * 0.45,
            //                   decoration: BoxDecoration(
            //                       color: Color(0xff24a0a8),
            //                       borderRadius: BorderRadius.circular(8)),
            //                   child: MaterialButton(
            //                     onPressed: () {
            //                       Navigator.pushAndRemoveUntil(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) =>
            //                                   ServiceScreen()),
            //                           (route) => false);
            //                     },
            //                     child: Center(
            //                       child: Text(
            //                         "Okay",
            //                         style: GoogleFonts.poppins(
            //                             fontWeight: FontWeight.w600,
            //                             fontSize: width * 0.055,
            //                             color: Colors.white),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     });
          },
          child: Text(timeText,
              style: TextStyle(
                  color: timeBtnColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15))),
    );
  }
}
