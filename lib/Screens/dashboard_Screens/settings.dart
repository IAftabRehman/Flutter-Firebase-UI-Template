import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.raleway(
            fontSize: 23.3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.07,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("Account", style: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Icon(Icons.arrow_forward_rounded, color: Color(0xffD4D4D4),)
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.07,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("Rate our app", style: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Icon(Icons.arrow_forward_rounded, color: Color(0xffD4D4D4))
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.07,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.logout_outlined, color: Colors.red),
                  SizedBox(width: 10),
                  Text("LogOut", style: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
