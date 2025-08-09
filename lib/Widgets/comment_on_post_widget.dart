import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class comment_on_post_widget extends StatelessWidget {
  final String profile;
  final String name;
  final String date;
  final String comment;

  const comment_on_post_widget({
    required this.profile,
    required this.name,
    required this.date,
    required this.comment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        profile,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            date,
                            style: GoogleFonts.raleway(
                              fontSize: 12,
                              color: Color(0xffB4B4B4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 10),
                          Text(
                            comment,
                            style: GoogleFonts.raleway(fontSize: 11.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}