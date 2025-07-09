import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/textBox_Widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height * 0.6,
            child: Image.asset(
              'assets/images/registration_image_1.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: height * 0.3,
            left: 0,
            right: 0,
            height: height * 0.75,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Again!",
                      style: GoogleFonts.raleway(
                        fontSize: 23,
                        color: Color(0xFF292929),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Login to Access Your Account",
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.33,
                        color: Color(0xFF292929),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextBoxWithOutDashes(label: "Email"),
                    SizedBox(height: 15),
                    TextBoxWithOutDashes(label: "Password"),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.raleway(
                            fontSize: 13.33,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF339D44),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF339D44),
                        minimumSize: Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 15),
                    Text(
                      "Don’t have an account?",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.raleway(
                          fontSize: 27.65,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF339D44),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
