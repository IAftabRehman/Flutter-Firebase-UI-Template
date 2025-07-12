import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
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
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.green, size: 35),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.green, size: 35),
            ),
          ],

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
          ),
        ),
        body: TabBarView(children: [
          CustomVideoWidget(),
          Center(child: Text("Screen Not Available in Figma", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
        ]),
      ),
    );
  }
}

class CustomVideoWidget extends StatelessWidget {
  const CustomVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: height * 0.45,
            width: double.infinity,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("How to Start A Tractor", style: GoogleFonts.raleway(fontSize: 18, fontWeight: FontWeight.w400)),
                          RichText(
                            text: TextSpan(
                              text: 'Upload Date ',
                              style: GoogleFonts.raleway(
                                color: Colors.black38,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Aftab',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(onPressed: (){}, icon: Icon(Icons.accessibility_new, size: 30))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Image.asset("assets/images/video_1.png", height: height * 0.25, width: double.infinity, fit: BoxFit.cover),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

