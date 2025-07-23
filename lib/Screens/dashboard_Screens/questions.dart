import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Screens/dashboard_Screens/addPost.dart';
import '../../Widgets/post_show_widget.dart';
import 'answerTabBar.dart';

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
        body: const TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomProfilePost(
                    name: "Fareeha Sadaqat",
                    secondText: "10 minutes ago",
                    caption: "I have an issue regarding this vehicle",
                    profileImage: "assets/images/questions_profile_1.jpg",
                    onboardingImages: [
                      "assets/images/questions.png",
                      "assets/images/questions.png",
                      "assets/images/questions.png",
                      "assets/images/questions.png",
                      "assets/images/questions.png",
                      "assets/images/questions.png",
                    ],
                  ),
                  CustomProfilePost(
                    name: "Muhammad Ali Nizami",
                    secondText: "10 minutes ago",
                    caption:
                        "What is the process of purchasing Vehicle from hardware store?",
                    profileImage: "assets/images/questions_profile_2.jpg",
                  ),
                  CustomProfilePost(
                    name: "Masab Mehmood",
                    secondText: "15 minutes ago",
                    caption:
                        "What is the process of purchasing Vehicle from hardware store?",
                    profileImage: "assets/images/questions_profile_4.jpg",
                  ),
                  CustomProfilePost(
                    name: "Janat Mehmood",
                    secondText: "10 minutes ago",
                    caption:
                        "What is the process of purchasing Vehicle from hardware store?",
                    profileImage: "assets/images/questions_profile_3.jpg",
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
            AnsweredTabBar(),
          ],
        ),
      ),
    );
  }
}





class TopBarExample extends StatefulWidget {
  const TopBarExample({super.key});

  @override
  _TopBarExampleState createState() => _TopBarExampleState();
}

class _TopBarExampleState extends State<TopBarExample> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    Center(child: Text("Home Screen", style: TextStyle(fontSize: 25))),
    Center(child: Text("Profile Screen", style: TextStyle(fontSize: 25))),
    Center(child: Text("Settings Screen", style: TextStyle(fontSize: 25))),
  ];

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildButton(String text, int index) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onButtonPressed(index),
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedIndex == index ? Colors.blue : Colors.grey,
        ),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top Button Navigation")),
      body: Column(
        children: [
          Row(
            children: [
              buildButton("Home", 0),
              buildButton("Profile", 1),
              buildButton("Settings", 2),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: screens[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
