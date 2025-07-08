import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration2 extends StatelessWidget {
  const Registration2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal Details",
                style: GoogleFonts.raleway(
                  fontSize: 23.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Enter your personal details",
                style: GoogleFonts.raleway(
                  fontSize: 13.33,
                  color: Color(0xffb4b4b4),
                ),
              ),
              SizedBox(height: 20),
              ReUsableContainerWithDashes(label: "Upload Profile Image"),
              SizedBox(height: 10),
              ReUsableContainerWithOutDashes(label: "Choose Experts"),
              SizedBox(height: 10),
              ReUsableContainerWithOutDashes(label: "Qualification"),
              SizedBox(height: 10),
              ReUsableContainerWithOutDashes(label: "Contact"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Next",
                  style: GoogleFonts.raleway(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff339D44),
                  minimumSize: Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Back",
                  style: GoogleFonts.raleway(
                    fontSize: 13.33,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff339D44),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReUsableContainerWithOutDashes extends StatelessWidget {
  final String label;

  // final String controller;

  const ReUsableContainerWithOutDashes({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffD4D4D4), width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Center(
          child: TextFormField(
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 18, color: Colors.black),
            cursorColor: Colors.blue,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
              labelStyle: TextStyle(color: Color(0xffD4D4D4), fontSize: 13),
              hintStyle: TextStyle(fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}

class ReUsableContainerWithDashes extends StatelessWidget {
  final String label;
  // final String controller;
  const ReUsableContainerWithDashes({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Center(
          child: TextFormField(
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 18, color: Colors.black),
            cursorColor: Colors.blue,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
              labelStyle: TextStyle(color: Color(0xffD4D4D4), fontSize: 13),
              hintStyle: TextStyle(fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
