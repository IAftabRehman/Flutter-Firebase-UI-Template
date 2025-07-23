import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/postVideo.dart';
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
                    color: const Color(0xff339D44),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color(0xffB4B4B4),
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
                  contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
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
                children: const [
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
            const Center(
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



