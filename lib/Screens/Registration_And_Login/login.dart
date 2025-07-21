// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:internship_first_task/Screens/Registration_And_Login/forgotPassword.dart';
// import 'package:internship_first_task/Screens/Registration_And_Login/registration.dart';
// import 'package:internship_first_task/Screens/dashboard_Screens/homeDashboard.dart';
// import '../../Data/Services/AuthenticationServices.dart';
// import '../../Widgets/textBox_Widget.dart';
//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   bool isLoading = false;
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final keyboard = MediaQuery.of(context).viewInsets.bottom != 0;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             height: keyboard ? height * 0.3 : height * 0.7,
//             child: Image.asset(
//               'assets/images/login_image.png',
//               fit: BoxFit.fill,
//             ),
//           ),
//
//           Positioned(
//             top: keyboard ? height * 0.1 : height * 0.4,
//             left: 0,
//             right: 0,
//             height: keyboard ?  height * 1 : height * 0.75,
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 40,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Welcome Again!",
//                       style: GoogleFonts.raleway(
//                         fontSize: 23,
//                         color: const Color(0xFF292929),
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     const SizedBox(height: 3),
//                     Text(
//                       "Login to Access Your Account",
//                       style: GoogleFonts.raleway(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 13.33,
//                         color: const Color(0xFF292929),
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     TextBoxWithOutDashes(label: "Email", controller: email),
//                     const SizedBox(height: 15),
//                     TextBoxWithOutDashes(
//                       label: "Password",
//                       controller: password,
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ForgotPassword(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           "Forgot Password?",
//                           style: GoogleFonts.raleway(
//                             fontSize: 13.33,
//                             fontWeight: FontWeight.w300,
//                             color: const Color(0xFF339D44),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     isLoading
//                         ? const Center(child: CircularProgressIndicator())
//                         : ElevatedButton(
//                             onPressed: () {
//                               try {
//                                 isLoading = true;
//                                 setState(() {});
//
//                                 if (email.text.isEmpty) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text("Email cannot be empty"),
//                                     ),
//                                   );
//                                   return;
//                                 }
//                                 if (password.text.isEmpty) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text("Password cannot be empty"),
//                                     ),
//                                   );
//                                   return;
//                                 }
//                                 isLoading = true;
//                                 setState(() {});
//                                 AuthenticationServices()
//                                     .loginUser(
//                                       email: email.text,
//                                       password: password.text,
//                                     )
//                                     .then((val) {
//                                       isLoading = false;
//                                       setState(() {});
//                                       if (true) {
//                                         showDialog(
//                                           context: context,
//                                           builder: (context) {
//                                             return AlertDialog(
//                                               title: Text("Message"),
//                                               content: Text("LoggedIn"),
//                                               actions: [
//                                                 TextButton(
//                                                   onPressed: () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             CustomBottomBarWidget(),
//                                                       ),
//                                                     );
//                                                   },
//                                                   child: const Text("Next"),
//                                                 ),
//                                               ],
//                                             );
//                                           },
//                                         );
//                                       }
//                                     });
//                               } catch (e) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text(e.toString())),
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFF339D44),
//                               minimumSize: Size(double.infinity, 60),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             child: Text(
//                               "Login",
//                               style: GoogleFonts.raleway(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//
//                     const SizedBox(height: 10),
//                     Text(
//                       "Don’t have an account?",
//                       style: GoogleFonts.raleway(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Registration(),
//                           ),
//                         );
//                       },
//                       style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
//                       child: Text(
//                         "Sign Up",
//                         style: GoogleFonts.raleway(
//                           fontSize: 27.65,
//                           fontWeight: FontWeight.bold,
//                           color: const Color(0xFF339D44),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Data/Provider/AuthenticationProvider.dart';
import 'package:provider/provider.dart';
import '../../Screens/Registration_And_Login/forgotPassword.dart';
import '../../Screens/Registration_And_Login/registration.dart';
import '../../Widgets/textBox_Widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthenticationProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: keyboardVisible ? height * 0.3 : height * 0.7,
            child: Image.asset(
              'assets/images/login_image.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: keyboardVisible ? height * 0.1 : height * 0.4,
            left: 0,
            right: 0,
            height: keyboardVisible ? height * 1 : height * 0.75,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Again!",
                      style: GoogleFonts.raleway(
                        fontSize: 23,
                        color: const Color(0xFF292929),
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
                    const SizedBox(height: 30),
                    TextBoxWithOutDashes(label: "Email", controller: email),
                    const SizedBox(height: 15),
                    TextBoxWithOutDashes(label: "Password", controller: password),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ForgotPassword()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.raleway(
                            fontSize: 13.33,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFF339D44),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                      onPressed: () {
                        if (email.text.isEmpty || password.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Email or Password cannot be empty"),
                            ),
                          );
                          return;
                        }

                        provider.login(
                          email: email.text,
                          password: password.text,
                          context: context,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF339D44),
                        minimumSize: const Size(double.infinity, 60),
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
                    const SizedBox(height: 10),
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
                          MaterialPageRoute(builder: (context) => const Registration()),
                        );
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text(
                        "Sign Up",
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
