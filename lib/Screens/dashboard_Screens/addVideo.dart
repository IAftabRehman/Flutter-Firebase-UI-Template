import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intership_first_task/Screens/dashboard_Screens/video.dart';

import '../../Widgets/textBox_Widget.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Video",
          style: GoogleFonts.raleway(
            fontSize: 23.3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: height * 0.22,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: Center(
                child: Text(
                  "Preview",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReUsableContainerWithDashes(label: 'Upload Video'),
                  SizedBox(height: height * 0.015),
                  ReUsableContainerWithDashes(label: 'Upload Thumbnails'),
                  SizedBox(height: height * 0.015),
                  TextBoxWithOutDashes(label: "Title", controller: null),
                  SizedBox(height: height * 0.015),
                  TextFormField(
                    maxLines: 10,
                    minLines: 3,
                    style: TextStyle(color: Colors.grey),
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.green),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "Descriptions",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.035),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: SizedBox(
                              height: 280,
                              width: 400,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.done_all,
                                    color: Colors.green,
                                    size: 50,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Uploaded",
                                    style: GoogleFonts.raleway(
                                      fontSize: 23.03,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff292929),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Video Uploaded",
                                    style: GoogleFonts.raleway(
                                      fontSize: 13.33,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffB4B4B4),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Video()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff339D44),
                                      minimumSize: Size(double.infinity, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      "View Videos",
                                      style: GoogleFonts.raleway(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      minimumSize: Size(double.infinity, height * 0.08),
                    ),
                    child: Text(
                      "Post",
                      style: GoogleFonts.raleway(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
