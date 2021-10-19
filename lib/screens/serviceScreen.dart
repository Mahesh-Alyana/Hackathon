import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/providers/service_provider.dart';
import 'package:hackathon/screens/viewServicepage.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:provider/provider.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  var _init = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<ServiceList_provider>(context).getServiceList().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    final serviceData = Provider.of<ServiceList_provider>(context);
    String temp = '';
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/topBar1.png",
                  width: width,
                ),
              ),
              Positioned(
                top: height * 0.015,
                child: Column(
                  children: [
                    Text(
                      "Services",
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
                top: height * 0.015,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/notification.png"),
                ),
              )
            ],
          ),
          Container(
            height: height * 0.8,
            width: width,
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: serviceData.serviceList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewServiceScreen(
                                        serviceName:
                                            "${serviceData.serviceList[index].nameOfService}",
                                        description:
                                            '${serviceData.serviceList[index].description}',
                                        image:
                                            '${serviceData.serviceList[index].images!.split('?')[0]}',
                                        slug:
                                            "${serviceData.serviceList[index].slug}",
                                        cost:
                                            "${serviceData.serviceList[index].prizePerSlot}",
                                      )),
                              (route) => true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: height * 0.175,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                color: Color(0xffF8FDFF),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: width * 0.01,
                                    color: Color(0xff7A9AA7)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: width * 0.01)
                                ]),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "${serviceData.serviceList[index].nameOfService}",
                                          style: TextStyle(
                                              color: Color(0xff39464E),
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold))),
                                ),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                        "assets/images/triangle1.png")),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        //  height: height*0.1,
                                        width: width * 0.5,
                                        child: Text(
                                          "${serviceData.serviceList[index].description}",
                                          style: GoogleFonts.fjordOne(
                                            color: Color(0xff39464E),
                                            fontSize: width * 0.02,
                                          ),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, bottom: 10),
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${serviceData.serviceList[index].images!.split('?')[0]}',
                                        width: width * 0.24,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                        "\$ ${serviceData.serviceList[index].prizePerSlot}",
                                        style: TextStyle(
                                            color: Color(0xff39464E))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
          ),
          BottomNavigation(),
        ],
      ),
    );
  }
}
