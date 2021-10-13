import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/screens/signUpScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TextEditingController _emailTC = TextEditingController();
    TextEditingController _passwordTC = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: height * 0.2,
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
            Container(
              width: width * 0.89,
              height: height * 0.0729,
              child: TextFormField(
                controller: _emailTC,
                validator: MultiValidator([
                  EmailValidator(errorText: 'invalid email'),
                  RequiredValidator(errorText: "This can't be empty"),
                  MinLengthValidator(13, errorText: 'email can\'t be empty')
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
                      RequiredValidator(errorText: "This can't be empty"),
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
                onPressed: () {},
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
      ),
    );
  }
}
