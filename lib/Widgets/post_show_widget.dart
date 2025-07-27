import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Screens/dashboard_Screens/answers.dart';

class CustomProfilePost extends StatefulWidget {
  final String name;
  final String secondText;
  final String caption;
  final String answer;
  final String postId;
  final String profileImage;
  final List<String>? onboardingImages;

  const CustomProfilePost({
    super.key,
    required this.name,
    required this.secondText,
    required this.caption,
    required this.answer,
    required this.postId,
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
    int timestamp = int.parse(widget.secondText.toString());
    final exactTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.network(
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
                      "${DateFormat('hh:mm').format(exactTime)} ago",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                widget.answer == "Answered"
                    ? TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnswersNavigator(
                                name: widget.name,
                                secondText:
                                    "${DateFormat('hh:mm').format(exactTime)} ago",
                                caption: widget.caption,
                                postId: widget.postId,
                                profileImage: widget.profileImage,
                                onboardingImages: widget.onboardingImages ?? [],
                              ),
                            ),
                          );
                        },
                        child: Text(
                          widget.answer.toString(),
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      )
                    : widget.answer == "Pending"
                    ? Text(
                        widget.answer.toString(),
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      )
                    : SizedBox(),
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
                      return Image.network(
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
                        dotHeight: 7,
                        dotWidth: 7,
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
