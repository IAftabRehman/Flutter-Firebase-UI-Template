import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_first_task/Data/Models/uploadVideoModel.dart';
import 'package:internship_first_task/Data/Services/UploadVideoServices.dart';
import 'package:internship_first_task/Screens/dashboard_Screens/video.dart';
import '../../Data/Services/RegistrationServices.dart';
import '../../Widgets/textBox_Widget.dart';
import '../Registration_And_Login/registration2.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  bool isLoading = false;
  bool isUploading = false;
  File? selectedVideoFile;
  void _handleUploadVideo() async {
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedVideoFile = File(pickedFile.path);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Video selected")),
      );
    }
  }


  String? thumbnail;
  Future<void> pickThumbnail() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      String? uploadedImageUrl = await RegistrationServices.uploadImageToImgbb(
        imageFile,
      );

      if (uploadedImageUrl != null) {
        setState(() {
          thumbnail = uploadedImageUrl;
          print("Profile Image Uploaded: $uploadedImageUrl");
        });
      }
    }
  }

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom != 0;
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
                    child: const Center(
                      child: Text(
                        "Preview",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: _handleUploadVideo,
                    child: VideoPickerWidget(imageType: "Video"),
                  ),
                  SizedBox(height: height * 0.015),
                  InkWell(
                    onTap: pickThumbnail,
                    child: ImagePickerWidget(imageType: "Thumbnails"),
                  ),
                  SizedBox(height: height * 0.015),
                  TextBoxWithOutDashes(label: "Title", controller: title),
                  SizedBox(height: height * 0.015),
                  TextFormField(
                    controller: description,
                    maxLines: 10,
                    minLines: 3,
                    style: const TextStyle(color: Colors.grey),
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.green),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "Descriptions",
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.035),
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () async {
                            if (title.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Title not be empty")),
                              );
                              return;
                            } else if (description.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Title not be empty")),
                              );
                              return;
                            }
                            try {
                              isLoading = true;
                              setState(() {});
                              final videoUrl = await UploadVideoServices().uploadVideoToCloudinary(selectedVideoFile!);

                              if (videoUrl == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Video upload failed")),
                                );
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              }

                              final videoModel = UploadVideoModel(
                                docId: DateTime.now().millisecondsSinceEpoch.toString(),
                                createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
                                uploadVideo: videoUrl,
                                uploadThumbnail: thumbnail,
                                videoTitle: title.text,
                                videoDescription: description.text,
                              );

                              // ✅ Upload model to Firebase
                              await UploadVideoServices().uploadVideo(videoModel);

                              setState(() {
                                isLoading = false;
                              });
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            }

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: 280,
                                    width: 400,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Video(),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff339D44),
                                            minimumSize: Size(
                                              double.infinity,
                                              50,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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

class VideoPickerWidget extends StatefulWidget {
  final String imageType;

  VideoPickerWidget({super.key, required this.imageType});

  @override
  State<VideoPickerWidget> createState() => _VideoPickerWidgetState();
}

class _VideoPickerWidgetState extends State<VideoPickerWidget> {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        color: Colors.green,
        dashPattern: [15, 10],
        strokeWidth: 1.2,
        child: Container(
          height: 60,
          width: double.infinity,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "Upload ${widget.imageType} Image",
                  style: const TextStyle(color: Colors.black),
                ),
                const Spacer(),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    fit: BoxFit.contain,
                    'assets/images/video_uploader.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
