import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Data/Models/answeringModel.dart';
import 'package:internship_first_task/Data/Services/AnsweringServices.dart';

class comment_on_video_widget extends StatelessWidget {
  // final String profile;
  // final String name;
  // final String date;
  // final String comment;
  //
  // const comment_on_video_widget({
  //   required this.profile,
  //   required this.name,
  //   required this.date,
  //   required this.comment,
  //   super.key,
  // });



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
        body: TabBarView(
          children: [
            allComments(),
            allComments(),
            allComments(),
          ],
        ),
      ),
    );
  }
}

class allComments extends StatelessWidget {
  allComments({super.key});
  TextEditingController typeComment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: typeComment,
                decoration: InputDecoration(
                  labelText: "Comment...",
                  suffixIcon: IconButton(icon: Icon(Icons.send), onPressed: (){
                    AnsweringServices().comment_on_video(AnsweringModel(
                      docId: DateTime.now().microsecondsSinceEpoch.toString(),
                      answering: typeComment.text,
                      createdAt: DateTime.now().millisecondsSinceEpoch.toString()
                    ));
                  })
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/questions_profile_1.jpg",
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
                        Text(
                          "name",
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "date",
                          style: GoogleFonts.raleway(
                            fontSize: 12,
                            color: Color(0xffB4B4B4),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "comment",
                          style: GoogleFonts.raleway(fontSize: 14),
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
    );
  }
}
