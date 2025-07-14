import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  bottom: -100,
                  left: 0,
                  right: 0,
                  child: Image.asset("assets/images/no_data_found_2nd.png"),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/no_data_found_1st.png"),
                      SizedBox(height: 20),
                      Text(
                        "No Data Found",
                        style: GoogleFonts.raleway(
                          fontSize: 23.13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff292929),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "You have not answered any questions yet",
                          style: GoogleFonts.raleway(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffB4B4B4),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          child: Text(
                            "Back To Home",
                            style: GoogleFonts.raleway(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
      ),
    );
  }
}
