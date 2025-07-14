import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

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
                "assets/images/no_internet.png",
                width: double.infinity,
                height: height * 1.0,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: height * 0.25,
                right: height * 0.02,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Connection Lost",
                      style: GoogleFonts.raleway(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Something went wrong.",
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10)
                          )
                        ),
                        onPressed: () {},
                        child: Text(
                          "Retry",
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                            color: Colors.green,
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
