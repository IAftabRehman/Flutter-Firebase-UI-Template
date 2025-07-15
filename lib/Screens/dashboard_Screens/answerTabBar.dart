import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnsweredTabBar extends StatefulWidget {
  const AnsweredTabBar({super.key});

  @override
  State<AnsweredTabBar> createState() => _AnsweredTabBarState();
}

class _AnsweredTabBarState extends State<AnsweredTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                const SizedBox(height: 20),
                Text(
                  "No Data Found",
                  style: GoogleFonts.raleway(
                    fontSize: 23.13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff292929),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "You have not answered any questions yet",
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB4B4B4),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
