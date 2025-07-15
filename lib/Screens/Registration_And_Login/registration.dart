import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intership_first_task/Screens/Registration_And_Login/login.dart';
import 'package:intership_first_task/Screens/Registration_And_Login/registration2.dart';
import '../../Widgets/textBox_Widget.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool isLoading = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: keyboard ? height * 0.0 : height * 0.6,
            child: Image.asset(
              'assets/images/registration_image_1.png',
              fit: BoxFit.cover,
            ),
          ),


          Positioned(
            top: keyboard ? height * 0.0: height * 0.3,
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
                      "Create Account",
                      style: GoogleFonts.raleway(
                        fontSize: 23,
                        color: Color(0xFF292929),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Login to Access Your Account",
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.33,
                        color: const Color(0xFF292929),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextBoxWithOutDashes(label: "Name", controller: name),
                    const SizedBox(height: 10),
                    TextBoxWithOutDashes(label: "Email", controller: email),
                    const SizedBox(height: 10),
                    TextBoxWithOutDashes(
                      label: "Password",
                      controller: password,
                    ),
                    const SizedBox(height: 10),
                    TextBoxWithOutDashes(
                      label: "Confirm Password",
                      controller: confirmPassword,
                    ),
                    const SizedBox(height: 20),

                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () async {
                              if (name.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Name can't be empty"),
                                  ),
                                );
                                return;
                              }
                              if (email.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Email can't be empty"),
                                  ),
                                );
                                return;
                              }
                              if (password.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Password can't be empty"),
                                  ),
                                );
                                return;
                              }
                              if (password.text != confirmPassword.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Password Not Matching"),
                                  ),
                                );
                                return;
                              }

                              try{
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Registration2(
                                  name: name.text,
                                  email: email.text,
                                  password: password.text,
                                )));
                              }
                              catch(e){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF339D44),
                              minimumSize: Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Next",
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                    const SizedBox(height: 10),
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                      child: Text(
                        "Login",
                        style: GoogleFonts.raleway(
                          fontSize: 27.65,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF339D44),
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

