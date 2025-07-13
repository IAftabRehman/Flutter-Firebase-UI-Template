import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intership_first_task/Screens/Registration_And_Login/forgotPassword.dart';
import 'package:intership_first_task/Screens/Registration_And_Login/registration.dart';
import 'package:intership_first_task/Screens/dashboard_Screens/homeDashboard.dart';
import '../../Widgets/textBox_Widget.dart';

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
            height: height * 0.7,
            child: Image.asset(
              'assets/images/login_image.png',
              fit: BoxFit.fill,
            ),
          ),

          Positioned(
            top: height * 0.4,
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
                    TextBoxWithOutDashes(label: "Email", controller: null,),
                    SizedBox(height: 15),
                    TextBoxWithOutDashes(label: "Password", controller: null,),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
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
                    SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomBottomBarWiget(),
                          ),
                        );
                      },
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

                    SizedBox(height: 10),
                    Text(
                      "Don’t have an account?",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registration(),
                          ),
                        );
                      },
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
