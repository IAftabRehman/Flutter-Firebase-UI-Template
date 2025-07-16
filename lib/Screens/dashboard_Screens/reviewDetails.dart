import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Screens/dashboard_Screens/profile.dart';

class ReviewDetails extends StatelessWidget {
  const ReviewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ratings & Reviews",
          style: GoogleFonts.raleway(
            fontSize: 23.3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: const [
              SizedBox(height: 15),
              ContainerReviewWidget(
                profile: "assets/images/questions_profile_1.jpg",
                name: "Fareeha Sadaqat",
                time: "20 mins ago",
                reviews: "Recommended Experts",
              ),
              SizedBox(height: 5),
              ContainerReviewWidget(
                profile: "assets/images/questions_profile_2.jpg",
                name: "Fareeha Sadaqat",
                time: "20 mins ago",
                reviews: "Recommended Experts",
              ),
              SizedBox(height: 5),
              ContainerReviewWidget(
                profile: "assets/images/questions_profile_3.jpg",
                name: "Fareeha Sadaqat",
                time: "20 mins ago",
                reviews: "Recommended Experts",
              ),
              SizedBox(height: 5),
              ContainerReviewWidget(
                profile: "assets/images/questions_profile_4.jpg",
                name: "Fareeha Sadaqat",
                time: "20 mins ago",
                reviews: "Recommended Experts",
              ),
              SizedBox(height: 5),
              ContainerReviewWidget(
                profile: "assets/images/questions_profile_1.jpg",
                name: "Fareeha Sadaqat",
                time: "20 mins ago",
                reviews: "Recommended Experts",
              ),
              SizedBox(height: 5),
              ContainerReviewWidget(
                profile: "assets/images/questions_profile_2.jpg",
                name: "Fareeha Sadaqat",
                time: "20 mins ago",
                reviews: "Recommended Experts",
              ),
              SizedBox(height: 5),
              ContainerReviewWidget(
                profile: "assets/images/questions_profile_3.jpg",
                name: "Fareeha Sadaqat",
                time: "20 mins ago",
                reviews: "Recommended Experts",
              ),
              SizedBox(height: 5),
              ContainerReviewWidget(
                profile: "assets/images/questions_profile_4.jpg",
                name: "Fareeha Sadaqat",
                time: "20 mins ago",
                reviews: "Recommended Experts",
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
