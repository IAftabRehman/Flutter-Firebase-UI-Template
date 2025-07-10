import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intership_first_task/Screens/answers.dart';
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
            CustomProfileContainer(
              name: "Fareeha Sadaqat",
              secondText: "10 minutes ago",
              caption: "I have an issue regarding this vehicle",
              profileImage: "assets/images/questions_profile_1.jpg",
              onboardingImages: [
                "assets/images/questions.png",
                "assets/images/questions.png",
                "assets/images/questions.png",
                "assets/images/questions.png",
                "assets/images/questions.png",
                "assets/images/questions.png",
              ],
            ),
            CustomProfileContainer(name: "Muhammad Ali Nizami", secondText: "10 minutes ago", caption: "What is the process of purchasing Vehicle from hardware store?", profileImage: "assets/images/questions_profile_2.jpg"),
            CustomProfileContainer(name: "Masab Mehmood", secondText: "15 minutes ago", caption: "What is the process of purchasing Vehicle from hardware store?", profileImage: "assets/images/questions_profile_4.jpg"),
            CustomProfileContainer(name: "Janat Mehmood", secondText: "10 minutes ago", caption: "What is the process of purchasing Vehicle from hardware store?", profileImage: "assets/images/questions_profile_3.jpg"),


          ],
        ),
      ),
    );
  }
}


class CustomProfileContainer extends StatefulWidget {
  final String name;
  final String secondText;
  final String caption;
  final String profileImage;
  final List<String>? onboardingImages;

  const CustomProfileContainer({
    super.key,
    required this.name,
    required this.secondText,
    required this.caption,
    required this.profileImage,
    this.onboardingImages,
  });

  @override
  State<CustomProfileContainer> createState() => _CustomProfileContainerState();
}

class _CustomProfileContainerState extends State<CustomProfileContainer> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    widget.profileImage,
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        )),
                    Text(widget.secondText,
                        style: GoogleFonts.raleway(
                          fontSize: 11,
                          color: Colors.grey,
                        )),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Answers()));
                  },
                  child: Text("Answer",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 11,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(widget.caption.toString(), style: GoogleFonts.raleway(fontSize: 13.13, fontWeight: FontWeight.w500)),
          ),

          if (widget.onboardingImages != null &&
              widget.onboardingImages!.isNotEmpty)
            const SizedBox(height: 10),

          if (widget.onboardingImages != null &&
              widget.onboardingImages!.isNotEmpty)
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: widget.onboardingImages!.length,
                    itemBuilder: (context, i) {
                      return Image.asset(
                        widget.onboardingImages![i],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: widget.onboardingImages!.length,
                      effect: const SwapEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Colors.white,
                        dotColor: Colors.white54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
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