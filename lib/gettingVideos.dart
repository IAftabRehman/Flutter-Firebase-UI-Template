import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Screens/dashboard_Screens/answers.dart';
import 'Screens/dashboard_Screens/answerTabBar.dart';

class gettingVideos extends StatefulWidget {
  const gettingVideos({super.key});

  @override
  State<gettingVideos> createState() => _gettingVideosState();
}

class _gettingVideosState extends State<gettingVideos> {
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
                    isSearching = !isSearching;
                  });
                },
                icon: Icon(
                  isSearching ? Icons.close : Icons.search,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: isSearching
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (value) {
                  // Add search logic
                },
                decoration: InputDecoration(
                  hintText: "Search it",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            )
                : Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 10),
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
                    Tab(text: "Pending"),
                    Tab(text: "Answered"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            AllTabContent(),
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

class AllTabContent extends StatelessWidget {
  const AllTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('createPosts')
          .snapshots(),
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No questions found"));
        }
        final docs = snapshot.data!.docs;
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final data = docs[index].data();
            return CustomProfileContainer(
              name: data['name'] ?? 'No Name',
              secondText: data['time'] ?? '',
              caption: data['caption'] ?? '',
              profileImage: data['image'] ?? 'assets/images/questions_profile_1.jpg',
              onboardingImages: List<String>.from(data['images'] ?? []),
            );
          },
        );
      },
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
  State<CustomProfileContainer> createState() =>
      _CustomProfileContainerState();
}

class _CustomProfileContainerState extends State<CustomProfileContainer> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: Image.asset(
                  widget.profileImage,
                  height: 20,
                  width: 20,
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
                        // profileImage: widget.profileImage,
                        onboardingImages: widget.onboardingImages ?? [],
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Answer",
                  style: TextStyle(color: Colors.green, fontSize: 11),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widget.caption,
            style: GoogleFonts.raleway(
              fontSize: 13.13,
              fontWeight: FontWeight.w500,
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
