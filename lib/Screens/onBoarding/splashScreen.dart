import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Screens/onBoarding/onboardingScreens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> movingScreen() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
  }

  @override
  void initState() {
    super.initState();
    movingScreen();
  }

  @override
  Widget build(BuildContext context) {
    // final textStyles = AppTextStyles(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            const Spacer(),
            Center(child: Image.asset("assets/images/splashScreen_logo_1.png", width: width * 0.33, height: height * 0.33, fit: BoxFit.contain,)),
            const Spacer(),
            Text("Powered by", style: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFFB7B9C6))),
            const SizedBox(height: 10),
            Image.asset("assets/images/splashScreen_logo_2.png")
          ],
        ),
      ),
    );
  }
}

