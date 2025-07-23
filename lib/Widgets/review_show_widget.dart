import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class reviews_show_widget extends StatelessWidget {
  final String profile;
  final String name;
  final String time;
  final String reviews;
  const reviews_show_widget({required this.profile, required this.name, required this.time, required this.reviews, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(
              profile,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w500)),
              Text(
                time,
                style: GoogleFonts.raleway(
                  fontSize: 12,
                  color: Color(0xffb4b4b4),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                reviews,
                style: GoogleFonts.raleway(fontSize: 16),
              ),
            ],
          ),

          const Spacer(),
          Row(
            children: const [
              Icon(Icons.star_outline, color: Colors.green, size: 20),
              Icon(Icons.star_outline, color: Colors.green, size: 20),
              Icon(Icons.star_outline, color: Colors.green, size: 20),
              Icon(Icons.star_outline, color: Colors.green, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
