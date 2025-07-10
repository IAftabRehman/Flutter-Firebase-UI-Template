import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Questions",
          style: GoogleFonts.raleway(
            fontSize: 23.3,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search, color: Colors.green, size: 35),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 270,
              width: double.infinity,
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/questions_profile.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fareeha Sadaqat",
                            style: GoogleFonts.raleway(
                              fontSize: 11.11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "10 mins ago",
                            style: GoogleFonts.raleway(
                              fontSize: 11.11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffb4b4b4),
                            ),
                          ),
                        ],
                      ),

                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Answered",
                            style: GoogleFonts.raleway(
                              fontSize: 11.11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff339D44),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("I have an issue regarding this vehicle", style: GoogleFonts.raleway(fontSize: 13.13, fontWeight: FontWeight.w500),),
                  ),
                  OnBoardingImage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingImage extends StatelessWidget {
  OnBoardingImage({super.key});

  final PageController controller = PageController();
  final List<String> imagePaths = [
    "assets/images/questions.png",
    "assets/images/questions.png",
    "assets/images/questions.png",
    "assets/images/questions.png",
    "assets/images/questions.png",
    "assets/images/questions.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            itemCount: imagePaths.length,
            itemBuilder: (context, i) {
              return Image.asset(
                imagePaths[i],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Positioned(
          top: 160,
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: imagePaths.length,
              effect: const SwapEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.white,
                dotColor: Colors.white54
              ),
            ),
          ),
        ),
      ],
    );
  }
}