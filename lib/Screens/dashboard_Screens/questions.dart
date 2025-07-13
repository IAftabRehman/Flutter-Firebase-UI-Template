import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'answerTabBar.dart';
import 'answers.dart';

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
              child: Column(
                children: [
                  CustomProfileContainer(
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
                  CustomProfileContainer(
                    name: "Muhammad Ali Nizami",
                    secondText: "10 minutes ago",
                    caption:
                        "What is the process of purchasing Vehicle from hardware store?",
                    profileImage: "assets/images/questions_profile_2.jpg",
                  ),
                  CustomProfileContainer(
                    name: "Masab Mehmood",
                    secondText: "15 minutes ago",
                    caption:
                        "What is the process of purchasing Vehicle from hardware store?",
                    profileImage: "assets/images/questions_profile_4.jpg",
                  ),
                  CustomProfileContainer(
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

class CustomProfileContainer extends StatefulWidget {
  final String name;
  final String secondText;
  final String caption;
  final String profileImage;
  final List<String>? onboardingImages;

  const CustomProfileContainer({
    super.key,
    required this.name,
    required this.secondText,
    required this.caption,
    required this.profileImage,
    this.onboardingImages,
  });

  @override
  State<CustomProfileContainer> createState() => _CustomProfileContainerState();
}

class _CustomProfileContainerState extends State<CustomProfileContainer> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    widget.profileImage,
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      widget.secondText,
                      style: GoogleFonts.raleway(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnswersNavigator(
                          name: widget.name,
                          secondText: widget.secondText,
                          caption: widget.caption,
                          profileImage: widget.profileImage,
                          onboardingImages: widget.onboardingImages ?? [],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Answer",
                    style: TextStyle(color: Colors.green, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              widget.caption.toString(),
              style: GoogleFonts.raleway(
                fontSize: 13.13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          if (widget.onboardingImages != null &&
              widget.onboardingImages!.isNotEmpty)
            const SizedBox(height: 10),

          if (widget.onboardingImages != null &&
              widget.onboardingImages!.isNotEmpty)
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: widget.onboardingImages!.length,
                    itemBuilder: (context, i) {
                      return Image.asset(
                        widget.onboardingImages![i],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: widget.onboardingImages!.length,
                      effect: const SwapEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Colors.white,
                        dotColor: Colors.white54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class OnBoardingImage extends StatelessWidget {
  OnBoardingImage({super.key});

  final PageController controller = PageController();
  final List<String> imagePaths = [
    "assets/images/questions.png",
    "assets/images/questions.png",
    "assets/images/questions.png",
    "assets/images/questions.png",
    "assets/images/questions.png",
    "assets/images/questions.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            itemCount: imagePaths.length,
            itemBuilder: (context, i) {
              return Image.asset(
                imagePaths[i],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Positioned(
          top: 160,
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: imagePaths.length,
              effect: const SwapEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.white,
                dotColor: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TopBarExample());
  }
}

class TopBarExample extends StatefulWidget {
  @override
  _TopBarExampleState createState() => _TopBarExampleState();
}

class _TopBarExampleState extends State<TopBarExample> {
  int selectedIndex = 0;

  final List<Widget> screens = [
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
      appBar: AppBar(title: Text("Top Button Navigation")),
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
