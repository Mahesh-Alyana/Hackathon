import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/api_services/api_service.dart';
import 'package:hackathon/models/signUpmodel.dart';
import 'package:hackathon/screens/loginScreen.dart';
import 'package:hackathon/screens/serviceScreen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future<void> signUp(String email, String password, String rePassword,
      String firstName, String lastName) async {
    String url = "${ApiConfig.host}auth/users/";
    SignUpRequestModel requestModel = SignUpRequestModel(
      email: email,
      password: password,
      rePassword: rePassword,
      firstName: firstName,
      lastName: lastName,
    );
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "email": email,
          "first_name": firstName,
          "last_name": lastName,
          "password": password,
          "re_password": rePassword,
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Successfully completed");
      print(response.body);
    } else {
      print(response.statusCode);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(json.decode(response.body)["email"] != null
                  ? "This is Email is already in us"
                  : "password show contain group of numerics(123...),alphabets(a,b,c....) and symbols(@#\$%)"),
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

  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  late String firtName;
  late String lastName;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: height * 0.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        "assets/images/elliptical.png",
                        width: width,
                      ),
                    ),
                    Positioned(
                      top: height * 0.09,
                      left: width * 0.25,
                      child: Image.asset(
                        "assets/images/signUp.png",
                        width: width * 0.47,
                      ),
                    ),
                    Positioned(
                      top: height * 0.279,
                      child: Text(
                        "Create Account",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.073,
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.33,
                      child: Text(
                        "Welcome",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.045,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        height: height * 0.0729,
                        width: width * 0.89,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x3C000000),
                              )
                            ],
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          controller: _username,
                          onSaved: (val) {
                            _formKey.currentState!.save();
                            print("saved");
                          },
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                  errorText: "UserName can't be empty")
                            ],
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                              prefixIcon: Icon(
                                Icons.person,
                                size: width * 0.08,
                              ),
                              hintText: "Enter your full name",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 0.048)),
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: height * 0.0729,
                      width: width * 0.89,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3C000000),
                            )
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      child: TextFormField(
                        controller: _email,
                        validator: MultiValidator([
                          EmailValidator(errorText: 'invalid email'),
                          RequiredValidator(errorText: "email can't be empty"),
                          MinLengthValidator(13,
                              errorText: 'email can\'t be empty')
                        ]),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              size: width * 0.08,
                            ),
                            hintText: "Enter your mail ID",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.048)),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: height * 0.0729,
                      width: width * 0.89,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x3C000000),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        controller: _password,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "Password can't be empty"),
                          MinLengthValidator(8,
                              errorText: "Password should be 8 characters")
                        ]),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: width * 0.08,
                            ),
                            hintText: "Enter your password",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.048)),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: height * 0.0729,
                      width: width * 0.89,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3C000000),
                            )
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      child: TextFormField(
                        controller: _confirmPassword,
                        validator: (val) {
                          if (val != _password.text) {
                            return 'It should match with above password';
                          }
                          MultiValidator([
                            RequiredValidator(
                                errorText: "Password can't be empty"),
                            MinLengthValidator(8,
                                errorText: "Password should be 8 characters"),
                          ]);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: width * 0.08,
                            ),
                            hintText: "Re-Enter your password",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.048)),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: height * 0.06,
                width: width * 0.58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff54a0ab),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      for (i = 0; i < _username.text.length; i++) {
                        if (_username.text[i] == ' ') {
                          setState(() {
                            firtName = _username.text.substring(0, i);
                            lastName = _username.text
                                .substring(i + 1, _username.text.length);
                          });
                          break;
                        }
                      }
                      await signUp(
                        _email.text,
                        _password.text,
                        _confirmPassword.text,
                        firtName,
                        lastName,
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ServiceScreen()),
                          (route) => false);
                    }
                  },
                  child: Center(
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.06,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "already have an account?",
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
                                      LoginScreen()),
                              (route) => true);
                        },
                        child: Text(
                          " Login",
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
      ),
    );
  }
}
