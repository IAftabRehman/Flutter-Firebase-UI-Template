import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Screens/dashboard_Screens/addPost.dart';
import '../../Data/Services/UploadPostServices.dart';
import '../../Widgets/post_show_widget.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Questions",
            style: GoogleFonts.raleway(
              fontSize: 23.3,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching; // Toggle state
                  });
                },
                icon: Icon(
                  isSearching ? Icons.close : Icons.search,
                  color: Colors.green,
                  size: 35,
                ),
              ),
            ),
            isSearching ?
            SizedBox.shrink() : IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddPost()));
              },
              icon:Icon(Icons.add, color: Colors.green, size: 35),
            )
          ],

          bottom: !isSearching
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
                          Tab(text: "Pending"),
                          Tab(text: "Answered"),
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
                        contentPadding: EdgeInsets.symmetric(
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
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                stream: UploadPostServices().getPosts(),
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
                      return CustomProfilePost(
                        name: data['name'] ?? 'Unknown',
                        secondText: data['createdAt'] ?? '',
                        caption: data['caption'] ?? '',
                        answer: "Answered",
                        postId: doc.id,
                        profileImage: data["profileImage"],
                        onboardingImages: List<String>.from(data['images'] ?? []),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                stream: UploadPostServices().getPostsWhereIsPending(),
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
                      return CustomProfilePost(
                        name: data['name'] ?? 'Unknown',
                        secondText: data['createdAt'] ?? '',
                        caption: data['caption'] ?? '',
                        answer: "Pending",
                        postId: "docId",
                        profileImage: data["profileImage"],
                        onboardingImages: List<String>.from(data['images'] ?? []),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                stream: UploadPostServices().getPostsWhereIsAnswered(),
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
                      return CustomProfilePost(
                        name: data['name'] ?? 'Unknown',
                        secondText: data['createdAt'] ?? '',
                        caption: data['caption'] ?? '',
                        answer: "",
                        postId: doc.id,
                        profileImage: data["profileImage"],
                        onboardingImages: List<String>.from(data['images'] ?? []),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

