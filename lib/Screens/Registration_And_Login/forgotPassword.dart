import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Data/Services/AuthenticationServices.dart';
import 'package:internship_first_task/Widgets/textBox_Widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final keyboard = MediaQuery.of(context).viewInsets.bottom != 0;
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
              decoration: const BoxDecoration(
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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forgot Password",
                          style: GoogleFonts.raleway(
                            fontSize: 23.04,
                            color: const Color(0xFF292929),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "Enter your registered  email below\nwe’ll send you a  reset link",
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.33,
                            color: const Color(0xFF292929),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextBoxWithOutDashes(label: "Email", controller: email),
                      ],
                    ),
                    keyboard ? SizedBox() : Spacer(),
                    isLoading ? Center(child: CircularProgressIndicator()) :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: ElevatedButton(
                            onPressed: () {
                              isLoading = true;
                              setState(() {});
                              AuthenticationServices().resetPassword(email.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF339D44),
                              minimumSize: const Size(double.infinity, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Get Link",
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
