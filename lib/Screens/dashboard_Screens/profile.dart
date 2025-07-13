import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intership_first_task/Screens/dashboard_Screens/edit_profile.dart';
import 'package:intership_first_task/Screens/dashboard_Screens/reviewDetails.dart';
import 'package:intership_first_task/Screens/dashboard_Screens/settings.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.raleway(
            fontSize: 23.3,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
            },
            icon: Icon(Icons.settings_outlined, color: Colors.green, size: 28),
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50, // adjust as needed
                backgroundImage: AssetImage(
                  "assets/images/questions_profile_1.jpg",
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "Muhammad Wajahat",
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: height * 0.005),
              Text(
                "mwajahat.038@gmail.com",
                style: GoogleFonts.raleway(fontSize: 14, color: Colors.green),
              ),
              SizedBox(height: height * 0.01),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.edit_outlined, color: Colors.white, size: 25),
                      SizedBox(width: 10),
                      Text(
                        "Edit Profile",
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              Row(
                children: [
                  Text("Status", style: TextStyle(fontSize: 15)),
                  const Spacer(),
                  Text("See Dashboard", style: TextStyle(color: Colors.green)),
                ],
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      color: Color(0xffFBFBFB),
                      child: Center(
                        child: Text(
                          "252 Answered",
                          style: GoogleFonts.raleway(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: Color(0xffFBFBFB),
                      child: Center(
                        child: Text(
                          "71 Pending",
                          style: GoogleFonts.raleway(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: Color(0xffFBFBFB),
                      child: Center(
                        child: Text(
                          "14 Videos",
                          style: GoogleFonts.raleway(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("Ratings & Reviews", style: TextStyle(fontSize: 15)),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewDetails()));
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),

              ContainerReviewWidget(profile: "assets/images/questions_profile_1.jpg", name: "Fareeha Sadaqat", time: "20 mins ago", reviews: "Recommended Experts",),
              const SizedBox(height: 5),
              ContainerReviewWidget(profile: "assets/images/questions_profile_2.jpg", name: "Masab Mehmood", time: "20 mins ago", reviews: "Very Patient",),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerReviewWidget extends StatelessWidget {
  final String profile;
  final String name;
  final String time;
  final String reviews;
  const ContainerReviewWidget({required this.profile, required this.name, required this.time, required this.reviews, super.key});

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
            children: [
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
