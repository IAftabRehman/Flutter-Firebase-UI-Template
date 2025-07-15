import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intership_first_task/Screens/dashboard_Screens/profile.dart';
import 'package:intership_first_task/Screens/dashboard_Screens/questions.dart';
import 'package:intership_first_task/Screens/dashboard_Screens/video.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'comments.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int selectedIndex = 0;
  String? userName;
  void getNameFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? '';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNameFromSharedPreference();
  }
  List<Widget> screenList = const [
    Text("First"),
    Text("First"),
    Text("First"),
    Text("First"),
    Text("First"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard!",
                style: GoogleFonts.raleway(
                  fontSize: 23.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Welcome to Dashboard, ',
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 11.11,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: userName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Row(
                children: [
                  Expanded(
                    child: ReUsableContainer(
                      icon: Icons.question_mark,
                      upperText: "224",
                      lowerText: "Total Questions",
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: ReUsableContainer(
                      icon: Icons.done_all,
                      upperText: "154",
                      lowerText: "Answer\nQuestions",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Expanded(
                    child: ReUsableContainer(
                      icon: Icons.panorama_fish_eye_outlined,
                      upperText: "1.5k",
                      lowerText: "Total Views",
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: ReUsableContainer(
                      icon: Icons.youtube_searched_for_rounded,
                      upperText: "12",
                      lowerText: "Total Videos",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          selectedIndex = val;
          setState(() {});
        },
        backgroundColor: Colors.red,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 40), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_outlined, size: 40),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call, size: 40),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment, size: 40),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 40),
            label: "",
          ),
        ],
      ),
    );
  }
}

class ReUsableContainer extends StatelessWidget {
  final IconData icon;
  final String upperText;
  final String lowerText;

  const ReUsableContainer({
    super.key,
    required this.icon,
    required this.upperText,
    required this.lowerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffFFFFFF),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 0,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Color(0xffD4D4D4)),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                upperText,
                style: GoogleFonts.raleway(
                  fontSize: 23.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                lowerText,
                style: GoogleFonts.raleway(
                  fontSize: 9.94,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomeDashboard(),
          item: ItemConfig(icon: Icon(Icons.home), activeForegroundColor: Colors.green),
        ),
        PersistentTabConfig(
          screen: Questions(),
          item: ItemConfig(icon: Icon(Icons.question_mark), activeForegroundColor: Colors.green),
        ),
        PersistentTabConfig(
          screen: Video(),
          item: ItemConfig(icon: Icon(Icons.play_circle_outline), activeForegroundColor: Colors.green),
        ),
        PersistentTabConfig(
          screen: Comments(),
          item: ItemConfig(icon: Icon(Icons.comment_outlined), activeForegroundColor: Colors.green),
        ),
        PersistentTabConfig(
          screen: Profile(),
          item: ItemConfig(icon: Icon(Icons.person), activeForegroundColor: Colors.green),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style4BottomNavBar(
        height: 60,
        navBarConfig: navBarConfig,

        navBarDecoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
        ),

        itemAnimationProperties: const ItemAnimation(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}
