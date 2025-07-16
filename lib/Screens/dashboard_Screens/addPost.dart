import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_first_task/Screens/dashboard_Screens/questions.dart';
import '../../Widgets/textBox_Widget.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController caption = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future getGalleryImage() async {
    final imagePick = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (imagePick != null) {
        _image = File(imagePick.path);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Not Selected")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Post",
          style: GoogleFonts.raleway(
            fontSize: 23.3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            keyboard
                ? SizedBox(height: 10)
                : Container(
                    margin: EdgeInsets.all(5),
                    height: height * 0.22,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1),
                    ),
                    child: Center(
                      child: _image != null
                          ? Image.file(_image!.absolute, height: 190)
                          : const Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.green,
                            ),
                    ),
                  ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.05),
                  TextBoxWithOutDashes(label: "Caption", controller: caption),
                  SizedBox(height: height * 0.015),
                  DottedBorder(
                    color: Colors.green,
                    strokeWidth: 1.5,
                    dashPattern: [9, 9],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    child: InkWell(
                      onTap: () {
                        getGalleryImage();
                      },
                      child: SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              _image != null
                                  ? Text(
                                      "Image Uploaded Successfully",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : Text(
                                      "Image Upload",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey,
                                      ),
                                    ),
                              const Spacer(),
                              Icon(Icons.upload, color: Colors.green, size: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
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
                                  const Icon(
                                    Icons.done_all,
                                    color: Colors.green,
                                    size: 50,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Uploaded",
                                    style: GoogleFonts.raleway(
                                      fontSize: 23.03,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff292929),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Video Uploaded",
                                    style: GoogleFonts.raleway(
                                      fontSize: 13.33,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffB4B4B4),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      try {

                                      } catch (e) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(content: Text(e.toString())),
                                        );
                                      }

                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Questions(),
                                        ),
                                      );
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
