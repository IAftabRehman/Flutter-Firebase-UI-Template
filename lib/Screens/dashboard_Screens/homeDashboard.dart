import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

              Row(
                children: [
                  Expanded(
                    child: BoxContainerWidget(
                      image: 'assets/images/dashboard_question.svg',
                      widthOfImage: 50,
                      upperText: "224",
                      lowerText: "Total Questions",
                    ),
                  ),
                  const SizedBox(width: 15),
                 Expanded(
                    child: BoxContainerWidget(
                      image: 'assets/images/dashboard_done.svg',
                      widthOfImage: 45,
                      upperText: "154",
                      lowerText: "Answer\nQuestions",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: BoxContainerWidget(
                      image: 'assets/images/dashboard_eye.svg',
                      widthOfImage: 50,
                      upperText: "1.5k",
                      lowerText: "Total Views",
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: BoxContainerWidget(
                      image: 'assets/images/dashboard_youtube.svg',
                      widthOfImage: 45,
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

class BoxContainerWidget extends StatelessWidget {
  final String image;
  final double widthOfImage;
  final String upperText;
  final String lowerText;

  const BoxContainerWidget({
    super.key,
    required this.image,
    required this.widthOfImage,
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
          SvgPicture.asset(
            image,
            width: widthOfImage,
          ),
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

