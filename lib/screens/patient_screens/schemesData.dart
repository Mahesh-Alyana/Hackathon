import 'package:flutter/material.dart';
import 'package:hackathon/providers/recommended_schemes_provider.dart';
import 'package:hackathon/providers/scheme_data_provider.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:hackathon/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class SchemesData extends StatefulWidget {
  const SchemesData({Key? key}) : super(key: key);

  @override
  _SchemesDataState createState() => _SchemesDataState();
}

class _SchemesDataState extends State<SchemesData> {
  var _init = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<SchemeList_provider>(context).getSchemeList().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
      Provider.of<RecommendedSchemeList_provider>(context)
          .getSchemeList()
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
    final schemeData = Provider.of<SchemeList_provider>(context);
    final recommendedSchemeData =
        Provider.of<RecommendedSchemeList_provider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopBar(),
          Container(
            height: height * 0.865,
            child: ListView.builder(
                itemCount: schemeData.schemeList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          ),
                          recommendedSchemeData.schemeList.length == 0
                              ? Center(
                                  child: Text(
                                      "You are not eligible for any scheme"),
                                )
                              : Container(
                                  height: height * 0.3,
                                  child: _isLoading
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : ListView.builder(
                                          itemCount: recommendedSchemeData
                                              .schemeList.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 20),
                                              child: Container(
                                                height: height * 0.13,
                                                width: width * 0.9,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x3E000000),
                                                        blurRadius: 3,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: height * 0.13,
                                                      width: width * 0.24,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffc4c4c4),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        7),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        7)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        width: width * 0.6,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                "${recommendedSchemeData.schemeList[index].name}",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "PTSans",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        width *
                                                                            0.065),
                                                              ),
                                                            ),
                                                            Wrap(
                                                              children: [
                                                                Text(
                                                                  "Eligibilty criteria: ",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "PTSans",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      fontSize:
                                                                          width *
                                                                              0.027),
                                                                ),
                                                                Text(
                                                                  "Age group eligible:${recommendedSchemeData.schemeList[index].elibleAge}\nCategory eligible:${recommendedSchemeData.schemeList[index].categortyElible}\nLast Date to apply:${recommendedSchemeData.schemeList[index].lastDateEligble}",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "PTSans",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          width *
                                                                              0.025),
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
                          Divider(),
                        ],
                      ),
                    );
                  }
                  return _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${schemeData.schemeList[index - 1].name}",
                                            style: TextStyle(
                                                fontFamily: "PTSans",
                                                fontWeight: FontWeight.w500,
                                                fontSize: width * 0.065),
                                          ),
                                        ),
                                        Wrap(
                                          children: [
                                            Text(
                                              "Eligibilty criteria: ",
                                              style: TextStyle(
                                                  fontFamily: "PTSans",
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: width * 0.027),
                                            ),
                                            Text(
                                              "Age group eligible:${schemeData.schemeList[index - 1].elibleAge}\nCategory eligible:${schemeData.schemeList[index - 1].categortyElible}\nLast Date to apply:${schemeData.schemeList[index - 1].lastDateEligble}",
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
