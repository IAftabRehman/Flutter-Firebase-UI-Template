import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomVideoWidget extends StatelessWidget {
  final String caption;
  final String uploadDate;
  final String video;
  final int views;
  final int comments;

  const CustomVideoWidget({
    required this.caption,
    required this.uploadDate,
    required this.video,
    required this.views,
    required this.comments,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height * 0.43,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          caption,
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Upload Date ',
                            style: GoogleFonts.raleway(
                              color: Colors.black38,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: uploadDate,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert, size: 30),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Image.asset(
                  video,
                  height: height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: height * 0.02),
                Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      color: Color(0xffB4B4B4),
                      size: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "$views Views",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        color: Color(0xffB4B4B4),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.comment_outlined,
                      color: Color(0xffB4B4B4),
                      size: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "$comments Comments",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        color: Color(0xffB4B4B4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0.8,
          height: 1.5,
        )
      ],
    );
  }
}