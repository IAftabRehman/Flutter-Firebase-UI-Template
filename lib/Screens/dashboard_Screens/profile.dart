import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Screens/dashboard_Screens/edit_profile.dart';
import 'package:internship_first_task/Screens/dashboard_Screens/reviewDetails.dart';
import 'package:internship_first_task/Screens/dashboard_Screens/settings.dart';

import '../../Widgets/review_show_widget.dart';

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
            icon: const Icon(Icons.settings_outlined, color: Colors.green, size: 28),
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
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
                      const Icon(Icons.edit_outlined, color: Colors.white, size: 25),
                      const SizedBox(width: 10),
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
                children: const [
                  Text("Status", style: TextStyle(fontSize: 15)),
                  Spacer(),
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
                      color: const Color(0xffFBFBFB),
                      child: Center(
                        child: Text(
                          "252 Answered",
                          style: GoogleFonts.raleway(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: const Color(0xffFBFBFB),
                      child: Center(
                        child: Text(
                          "71 Pending",
                          style: GoogleFonts.raleway(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: const Color(0xffFBFBFB),
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
                  const Text("Ratings & Reviews", style: TextStyle(fontSize: 15)),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewDetails()));
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),

              const reviews_show_widget(profile: "assets/images/questions_profile_1.jpg", name: "Fareeha Sadaqat", time: "20 mins ago", reviews: "Recommended Experts",),
              const SizedBox(height: 5),
              const reviews_show_widget(profile: "assets/images/questions_profile_2.jpg", name: "Masab Mehmood", time: "20 mins ago", reviews: "Very Patient",),
            ],
          ),
        ),
      ),
    );
  }
}

