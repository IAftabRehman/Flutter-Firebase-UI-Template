import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intership_first_task/Screens/dashboard_Screens/questions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnswersNavigator extends StatefulWidget {
  final String name;
  final String secondText;
  final String caption;
  final String profileImage;
  final List<String>? onboardingImages;

  const AnswersNavigator({
    super.key,
    required this.name,
    required this.secondText,
    required this.caption,
    required this.profileImage,
    this.onboardingImages,
  });

  @override
  State<AnswersNavigator> createState() => _AnswersNavigatorState();
}

class _AnswersNavigatorState extends State<AnswersNavigator> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Questions()),
            );
          },
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.green),
        ),
        title: Text(
          "Answer",
          style: GoogleFonts.raleway(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                              onboardingImages: [],
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
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              TextFormField(
                minLines: 5,
                maxLines: 10,
                style: const TextStyle(color: Colors.grey),
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.green),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: "Enter Your Answer",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
