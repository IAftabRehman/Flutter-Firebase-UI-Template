import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Data/Services/UploadVideoServices.dart';
import '../../Widgets/video_show_widget.dart';
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
              icon: Icon(
                isSearching ? Icons.search : Icons.close,
                color: Colors.green,
                size: 35,
              ),
            ),
            isSearching
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddVideo()),
                      );
                    },
                    icon: Icon(Icons.add, color: Colors.green, size: 35),
                  )
                : SizedBox.shrink(),
          ],

          bottom: isSearching
              ? PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
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
                )
              : PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    child: TextField(
                      // controller: searchController,
                      onChanged: (value) {
                        // Do filtering or API call here
                      },
                      decoration: InputDecoration(
                        hintText: "Search it",
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
        body: TabBarView(children: [AllVideoTabBar(), latestVideoTabBar()]),
      ),
    );
  }
}

class AllVideoTabBar extends StatefulWidget {
  const AllVideoTabBar({super.key});

  @override
  State<AllVideoTabBar> createState() => _AllVideoTabBarState();
}

class _AllVideoTabBarState extends State<AllVideoTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: UploadVideoServices().gettingVideos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No posts found"));
              }
              return Column(
                children: snapshot.data!.docs.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  return CustomVideoWidget(
                    caption: data['videoTitle'] ?? 'Unknown',
                    // description: data['videoDescription'] ?? '',
                    docId: doc.id,
                    video: data['uploadVideo'] ?? '',
                    uploadDate: data['createdAt'] ?? '',
                    thumbnail: data["uploadThumbnail"] ?? '',
                    views: int.tryParse(data['views'].toString()) ?? 0,
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class latestVideoTabBar extends StatefulWidget {
  const latestVideoTabBar({super.key});

  @override
  State<latestVideoTabBar> createState() => _latestVideoTabBarState();
}

class _latestVideoTabBarState extends State<latestVideoTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: UploadVideoServices().gettingLatestVideos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No posts found"));
              }
              return Column(
                children: snapshot.data!.docs.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  return CustomVideoWidget(
                    caption: data['videoTitle'] ?? 'Unknown',
                    // description: data['videoDescription'] ?? '',
                    docId: doc.id,
                    video: data['uploadVideo'] ?? '',
                    uploadDate: data['createdAt'] ?? '',
                    thumbnail: data["uploadThumbnail"] ?? '',
                    views: int.tryParse(data['views'].toString()) ?? 0,
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
