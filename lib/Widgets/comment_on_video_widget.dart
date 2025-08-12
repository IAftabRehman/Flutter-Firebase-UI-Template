import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Data/Models/answeringModel.dart';
import 'package:internship_first_task/Data/Provider/userProvider.dart';
import 'package:internship_first_task/Data/Services/AnsweringServices.dart';
import 'package:internship_first_task/Widgets/video_show_widget.dart';
import 'package:provider/provider.dart';
import '../Data/Services/UploadVideoServices.dart';

class comment_on_video_widget extends StatefulWidget {
  @override
  State<comment_on_video_widget> createState() =>
      _comment_on_video_widgetState();
}

class _comment_on_video_widgetState extends State<comment_on_video_widget> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Comments",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
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
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: GoogleFonts.raleway(
                    fontSize: 14,
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
        body: TabBarView(children: [allComments(), first(), first()]),
      ),
    );
  }
}

class allComments extends StatefulWidget {
  allComments({super.key});

  @override
  State<allComments> createState() => _allCommentsState();
}

class _allCommentsState extends State<allComments> {
  TextEditingController typeComment = TextEditingController();

  String? currentName;
  String? currentImage;

  @override
  void initState() {
    super.initState();
    () async {
      currentName = await AnsweringServices().getCurrentUserName();
      currentImage = await AnsweringServices().getCurrentUserProfileImage();
      setState(() {});
    }();
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          // Input field
          TextField(
            controller: typeComment,
            decoration: InputDecoration(
              labelText: "Comment...",
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () async {
                  if (typeComment.text.trim().isEmpty) return;
                  await AnsweringServices().comment_on_video(
                    AnsweringModel(
                      docId: DateTime.now().microsecondsSinceEpoch.toString(),
                      answering: typeComment.text.trim(),
                      createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: userProvider.name,
                      profileImage: userProvider.profileImage,
                    ),
                  );
                  typeComment.clear();
                },
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Comment list
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: AnsweringServices().getComments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No comments found"));
                }

                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final name = data['name'] ?? "Unknown User";
                    final profileImage = data['profileImage'] ??
                        "assets/images/questions_profile_1.jpg";
                    final comment = data['answering'] ?? "";
                    final date = data['createdAt'] != null
                        ? DateTime.fromMillisecondsSinceEpoch(
                      int.tryParse(data['createdAt']) ?? 0,
                    ) : null;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: profileImage.startsWith("http")
                                ? Image.network(
                              profileImage,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            )
                                : Image.asset(
                              profileImage,
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
                                Text(name,
                                    style: GoogleFonts.raleway(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                if (date != null)
                                  Text(
                                    "${date.day}/${date.month}/${date.year}",
                                    style: GoogleFonts.raleway(
                                      fontSize: 12,
                                      color: const Color(0xffB4B4B4),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                const SizedBox(height: 5),
                                Text(comment,
                                    style: GoogleFonts.raleway(fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser?.uid);
    return StreamBuilder<QuerySnapshot>(
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
    );
  }
}
