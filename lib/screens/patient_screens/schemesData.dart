import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';

class SchemesData extends StatefulWidget {
  const SchemesData({Key? key}) : super(key: key);

  @override
  _SchemesDataState createState() => _SchemesDataState();
}

class _SchemesDataState extends State<SchemesData> {
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
              Navigator.popUntil(context, (route) => false);
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
                          "Schemes",
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
                                  "Scheme $index",
                                  style: TextStyle(
                                      fontFamily: "PTSans",
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.065),
                                ),
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    "Details: ",
                                    style: TextStyle(
                                        fontFamily: "PTSans",
                                        fontWeight: FontWeight.w800,
                                        fontSize: width * 0.027),
                                  ),
                                  Text(
                                    "lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lore....",
                                    style: TextStyle(
                                        fontFamily: "PTSans",
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
          BottomNavigation()
        ],
      ),
    );
  }
}
