import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.green,
          ),
          title: RichText(
            text: TextSpan(
              text: 'Comments ',
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 23.3,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "(22)",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 23.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Color(0xff339D44),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xffB4B4B4),
                  labelStyle: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  tabs: const [
                    Tab(text: "All"),
                    Tab(text: "Most Recent"),
                    Tab(text: "Relevant"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: RichText(
                      text: TextSpan(
                        text: "Video",
                        style: GoogleFonts.raleway(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ": How To Start A Tractor",
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomCommentsWidget(
                    profile: "assets/images/questions_profile_1.jpg",
                    name: "Aftab",
                    date: "15/ 63/ 2002",
                    comment:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
                  ),
                  Divider(height: 1.5),
                  CustomCommentsWidget(
                    profile: "assets/images/questions_profile_2.jpg",
                    name: "Aftab",
                    date: "15/ 63/ 2002",
                    comment:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
                  ),
                  Divider(height: 1.5),
                  CustomCommentsWidget(
                    profile: "assets/images/questions_profile_3.jpg",
                    name: "Aftab",
                    date: "15/ 63/ 2002",
                    comment:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
                  ),
                  Divider(height: 1.5),
                  CustomCommentsWidget(
                    profile: "assets/images/questions_profile_4.jpg",
                    name: "Aftab",
                    date: "15/ 63/ 2002",
                    comment:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
                  ),
                  Divider(height: 1.5),
                  CustomCommentsWidget(
                    profile: "assets/images/questions_profile_1.jpg",
                    name: "Aftab",
                    date: "15/ 63/ 2002",
                    comment:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
                  ),
                  Divider(height: 1.5),
                  CustomCommentsWidget(
                    profile: "assets/images/questions_profile_2.jpg",
                    name: "Aftab",
                    date: "15/ 63/ 2002",
                    comment:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
                  ),
                  Divider(height: 1.5),
                ],
              ),
            ),
            Center(
              child: Text(
                "Screen Not Available in Figma",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                "Screen Not Available in Figma",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCommentsWidget extends StatelessWidget {
  final String profile;
  final String name;
  final String date;
  final String comment;

  const CustomCommentsWidget({
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
                    SizedBox(width: 10),
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

                          SizedBox(height: 10),
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
