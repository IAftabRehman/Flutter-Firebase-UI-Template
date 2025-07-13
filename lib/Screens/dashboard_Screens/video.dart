import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'addVideo.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  bool isSearching = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Training Videos",
            style: GoogleFonts.raleway(
              fontSize: 23.3,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
              icon: Icon(isSearching ? Icons.search : Icons.close, color: Colors.green, size: 35),
            ),
            isSearching ?
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddVideo()));
              },
              icon:Icon(Icons.add, color: Colors.green, size: 35),
            ) : SizedBox.shrink(),
          ],

          bottom: isSearching ? PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    Tab(text: "Recently Uploaded"),
                  ],
                ),
              ),
            ),
          ):
          PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: TextField(
                // controller: searchController,
                onChanged: (value) {
                  // Do filtering or API call here
                },
                decoration: InputDecoration(
                  hintText: "Search it",
                  contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomVideoWidget(
                    caption: "How to Start A Tractor",
                    uploadDate: "15 mins ago",
                    video: "assets/images/video_1.png",
                    views: 139,
                    comments: 22,
                  ),
                  CustomVideoWidget(
                    caption: "How to buy a Crane",
                    uploadDate: "21 Oct, 2021 Monday",
                    video: "assets/images/video_2.png",
                    views: 99,
                    comments: 10,
                  ),
                ],
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
                                style: TextStyle(
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
                      icon: Icon(Icons.more_vert, size: 30),
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
                    Icon(
                      Icons.remove_red_eye,
                      color: Color(0xffB4B4B4),
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "$views Views",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        color: Color(0xffB4B4B4),
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.comment_outlined,
                      color: Color(0xffB4B4B4),
                      size: 25,
                    ),
                    SizedBox(width: 5),
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
        Divider(
          thickness: 0.8,
          height: 1.5,
        )
      ],
    );
  }
}
