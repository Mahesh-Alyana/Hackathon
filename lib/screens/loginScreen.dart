import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/models/loginModel.dart';
import 'package:hackathon/screens/homeScreen.dart';
import 'package:hackathon/screens/serviceScreen.dart';
import 'package:hackathon/screens/signUpScreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var response;
  Future<LoginResponseModel> login(String email, String password) async {
    String url = "${ApiConfig.host}auth/jwt/create/";
    LoginRequestModel requestModel =
        LoginRequestModel(email: email, password: password);
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestModel.toJson()));
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.body);

      Map<String, dynamic> output = json.decode(response.body);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", output['access']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(json.decode(response.body)["detail"]),
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

  TextEditingController _emailTC = TextEditingController();
  TextEditingController _passwordTC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: height * 0.15,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/login.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Login to your account",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.07,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Welcome back",
                style: GoogleFonts.poppins(
                  color: Color(0xff909090),
                  fontWeight: FontWeight.w400,
                  fontSize: width * 0.05,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: width * 0.89,
                      height: height * 0.0729,
                      child: TextFormField(
                        controller: _emailTC,
                        validator: MultiValidator([
                          EmailValidator(errorText: 'invalid email'),
                          RequiredValidator(errorText: "This can't be empty"),
                          MinLengthValidator(13,
                              errorText: 'email can\'t be empty')
                        ]),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            size: width * 0.08,
                          ),
                          hintText: "Enter your Mail ID",
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.05,
                              color: Color(0x44000000)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: width * 0.89,
                        height: height * 0.0729,
                        child: TextFormField(
                          controller: _passwordTC,
                          obscureText: true,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                  errorText: "This can't be empty"),
                              MinLengthValidator(8,
                                  errorText:
                                      'password should be minimum of 8 characters')
                            ],
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              size: width * 0.08,
                            ),
                            hintText: "Enter your Password",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05,
                                color: Color(0x44000000)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.05,
                    color: Color(0xffdab052),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              height: height * 0.06,
              width: width * 0.58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff54a0ab),
              ),
              child: MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                    login(
                      _emailTC.text,
                      _passwordTC.text,
                    );
                  }
                },
                child: Center(
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.06,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "don’t have an account?",
                      style: GoogleFonts.poppins(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignUpScreen()),
                            (route) => false);
                      },
                      child: Text(
                        " Create Account",
                        style: GoogleFonts.poppins(
                          color: Color(0xffdab052),
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
