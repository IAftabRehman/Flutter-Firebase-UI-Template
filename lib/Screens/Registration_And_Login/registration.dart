import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intership_first_task/Data/Models/registrationModel.dart';
import 'package:intership_first_task/Screens/Registration_And_Login/login.dart';
import 'package:intership_first_task/Screens/Registration_And_Login/registration2.dart';
import '../../Data/Services/RegistrationServices.dart';
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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
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
                      "Create Account",
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
                    SizedBox(height: 15),
                    TextBoxWithOutDashes(label: "Name", controller: name),
                    SizedBox(height: 10),
                    TextBoxWithOutDashes(label: "Email", controller: email),
                    SizedBox(height: 10),
                    TextBoxWithOutDashes(
                      label: "Password",
                      controller: password,
                    ),
                    SizedBox(height: 10),
                    TextBoxWithOutDashes(
                      label: "Confirm Password",
                      controller: confirmPassword,
                    ),
                    SizedBox(height: 25),

                    isLoading
                        ? Center(child: CircularProgressIndicator())
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
                              try {
                                isLoading = true;
                                setState(() {});
                                await RegistrationServices()
                                    .createAccount(
                                      RegistrationModel(
                                        name: name.text,
                                        email: email.text,
                                        password: password.text,
                                        docId: DateTime.now()
                                            .millisecondsSinceEpoch.toString(),
                                      ),
                                    )
                                    .then((val) {
                                      isLoading = false;
                                      setState(() {});
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Registration2(),
                                        ),
                                      );
                                    });
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF339D44),
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

                    SizedBox(height: 10),
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

//
// class ReUsableContainer extends StatelessWidget {
//   final String label;
//   final TextEditingController controller;
//
//   ReUsableContainer({super.key, required this.label, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 65,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.green, width: 1.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         child: Center(
//           child: TextFormField(
//             controller: controller,
//             keyboardType: TextInputType.text,
//             textInputAction: TextInputAction.done,
//             style: TextStyle(fontSize: 18, color: Colors.black),
//             cursorColor: Colors.blue,
//             textAlign: TextAlign.left,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               labelText: label,
//               labelStyle: TextStyle(color: Colors.green, fontSize: 13),
//               hintStyle: TextStyle(fontSize: 17),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
