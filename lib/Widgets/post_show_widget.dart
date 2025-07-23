import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Screens/dashboard_Screens/answers.dart';

class CustomProfilePost extends StatefulWidget {
  final String name;
  final String secondText;
  final String caption;
  final String profileImage;
  final List<String>? onboardingImages;

  const CustomProfilePost({
    super.key,
    required this.name,
    required this.secondText,
    required this.caption,
    required this.profileImage,
    this.onboardingImages,
  });

  @override
  State<CustomProfilePost> createState() => _CustomProfilePostState();
}

class _CustomProfilePostState extends State<CustomProfilePost> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 0.1)],
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
                    Text(
                      widget.name,
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      widget.secondText,
                      style: GoogleFonts.raleway(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnswersNavigator(
                          name: widget.name,
                          secondText: widget.secondText,
                          caption: widget.caption,
                          profileImage: widget.profileImage,
                          onboardingImages: widget.onboardingImages ?? [],
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Answer",
                    style: TextStyle(color: Colors.green, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              widget.caption.toString(),
              style: GoogleFonts.raleway(
                fontSize: 13.13,
                fontWeight: FontWeight.w500,
              ),
            ),
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
  final List<String> imagePaths = const [
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
                dotColor: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}