import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Screens/Registration_And_Login/registration.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Data/Models/onboardingModel.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      image: "assets/images/onboarding1.png",
      title: "Get Rid of Third Person",
      description:
          "Using this application you can get rid of paying commission fee to third person. Now you can directly chat with sellers and deal with them.",
    ),
    OnBoardingModel(
      image: "assets/images/onboarding2.png",
      title: "Help in Market Analysis",
      description:
          "Using this application you can get rid of paying commission fee to third person. Now you can directly chat with sellers and deal with them.",
    ),
    OnBoardingModel(
      image: "assets/images/onboarding3.png",
      title: "Multilingual",
      description:
          "Using this application you can get rid of paying commission fee to third person. Now you can directly chat with sellers and deal with them.",
    ),
  ];

  PageController  controller = PageController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          Expanded(
            flex: 16,
            child: PageView.builder(
              controller: controller,
              itemCount: onBoardingList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: h * 0.5,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 40,
                            right: 0,
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Transform.rotate(
                                angle: 0.1,
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 300,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF339D44).withOpacity(0.2),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              onBoardingList[i].image.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: h * 0.03),
                    OnBoardingText(title: onBoardingList[i].title.toString(), description: onBoardingList[i].description.toString())
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
              child: Align(
                alignment: Alignment.topCenter,
                child: SmoothPageIndicator(
                  controller: controller, // PageController
                  count: onBoardingList.length,
                  effect: const SwapEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: Colors.green,
                  ), // your preferred effect
                  onDotClicked: (index) {},
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Registration()));
        },
        backgroundColor: Colors.white,
        child: Text(
          "Skip",
          style: GoogleFonts.raleway(fontSize: 13, color: Colors.green),
        ),
      ),
    );
  }
}


class OnBoardingText extends StatelessWidget {
  final String title, description;

  const OnBoardingText({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.raleway(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Color(0xFF292929),
              ),
            ),
            SizedBox(height: height * 0.010),
            Text(
              description,
              style: GoogleFonts.raleway(
                fontSize: 19.2,
                color: Color(0xFFB4B4B4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


