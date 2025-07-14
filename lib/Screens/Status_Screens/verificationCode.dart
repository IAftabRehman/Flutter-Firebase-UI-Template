import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff339D44),
      child: AlertDialog(
        content: SizedBox(
          height: 220,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Exit App?",
                style: GoogleFonts.raleway(
                  fontSize: 23.03,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff292929),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Press back again\nif you want to exit the app",
                style: GoogleFonts.raleway(
                  fontSize: 13.33,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB4B4B4),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Exit",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "No",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
