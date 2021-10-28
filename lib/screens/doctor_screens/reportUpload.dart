import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/widgets/BottomNavigationBar.dart';
import 'package:hackathon/widgets/top_bar.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class Service {
  Future<int> submitSubscription(
      {required File file,
      required String filename,
      required String token}) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://your api url with endpoint"),
    );
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Content-type": "multipart/form-data"
    };
    request.files.add(
      http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        contentType: MediaType('image', 'jpeg'),
      ),
    );
    request.headers.addAll(headers);
    request.fields
        .addAll({"name": "test", "email": "test@gmail.com", "id": "12345"});
    print("request: " + request.toString());
    var res = await request.send();
    print("This is response:" + res.toString());
    return res.statusCode;
  }
}

// ignore: camel_case_types
class ReportUpload_D extends StatefulWidget {
  const ReportUpload_D({Key? key}) : super(key: key);

  @override
  _ReportUpload_DState createState() => _ReportUpload_DState();
}

// ignore: camel_case_types
class _ReportUpload_DState extends State<ReportUpload_D> {
  late PickedFile _image;
  Future getImage() async {
    // ignore: deprecated_member_use
    final image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = image!;
    });
  }

  Future _uploadFile(filePath, name, descrption) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    Dio dio = new Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "JWT $obtainedToken";
    // Get base file name
    String fileName = basename(filePath.path);
    try {
      FormData formData = new FormData.fromMap({
        "name": '$name',
        "description": '$descrption',
        "image1": MultipartFile.fromFile(filePath.path, filename: fileName)
      });
      print(formData.files);

      Response response = await dio
          .post("${ApiConfig.host}doctors/reports/$name/", data: formData);
      print("File upload response: ${response.statusCode}");

      // Show the incoming message in snakbar
    } catch (e) {
      print("Exception Caught: $e");
    }
  }

  // ignore: non_constant_identifier_names
  TextEditingController test_name = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController patient_name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopBar(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Upload Reports",
                      style: TextStyle(
                          fontFamily: "playfairdisplay",
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.09,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.79,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffededed),
                    border: Border.all(
                      width: 1,
                      color: Color(0xFFC0C0C0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x31000000),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: TextFormField(
                    controller: patient_name,
                    decoration: InputDecoration(
                      hintText: "Patient's name",
                      hintStyle: GoogleFonts.ibmPlexSans(
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.045,
                      ),
                      suffixIcon: RotationTransition(
                        turns: AlwaysStoppedAnimation(45 / 360),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.navigation_outlined,
                            color: Color(0xB72384A4),
                            size: width * 0.09,
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
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
                    color: Color(0xffededed),
                    border: Border.all(
                      width: 1,
                      color: Color(0xFFC0C0C0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x31000000),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: TextFormField(
                    controller: test_name,
                    decoration: InputDecoration(
                      hintText: "Test name",
                      hintStyle: GoogleFonts.ibmPlexSans(
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.045,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          "assets/images/injection.png",
                          width: width * 0.1,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    height: height * 0.08,
                    width: width * 0.79,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffededed),
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFC0C0C0),
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
                            "Select file",
                            style: GoogleFonts.ibmPlexSans(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.045,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.add,
                            color: Color(0xCA2384A4),
                            size: width * 0.09,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: Color(0xff2384A4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      _uploadFile(_image, patient_name, test_name);
                    },
                    child: Center(
                      child: Text("Submit",
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'PTSans')),
                    ),
                  ),
                ),
                BottomNavigation()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
