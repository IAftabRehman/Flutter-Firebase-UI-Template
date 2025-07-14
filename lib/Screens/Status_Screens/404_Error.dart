import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorFile extends StatelessWidget {
  const ErrorFile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/error.png",
                width: double.infinity,
                height: height * 1.0,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 150,
                right: 0,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Page Not Found",
                      style: GoogleFonts.raleway(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "The page you are looking for doesn’t seem to exist..",
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffb4b4b4),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10)
                            )
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            "Back To Home",
                            style: GoogleFonts.raleway(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
