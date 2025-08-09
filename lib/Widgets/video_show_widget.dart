import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_first_task/Data/Services/UploadVideoServices.dart';
import 'package:internship_first_task/Widgets/comment_on_video_widget.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class CustomVideoWidget extends StatelessWidget {

  final String caption;
  final String docId;
  final String uploadDate;
  final String thumbnail;
  final String video;
  final int views;


  const CustomVideoWidget({
    required this.caption,
    required this.docId,
    required this.uploadDate,
    required this.thumbnail,
    required this.video,
    required this.views,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int timestamp = int.parse(uploadDate.toString());
    final exactTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height * 0.43,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          caption,
                          style: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
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
                                text: "${DateFormat('hh:mm').format(exactTime)} ago",
                                style: const TextStyle(
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert, size: 30),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                InkWell(
                  onTap: (){
                    UploadVideoServices().updateViews(docId.toString(), views + 1);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(videoUrl: video)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          thumbnail,
                          height: height * 0.25,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Icon(Icons.play_circle_fill, color: Colors.white, size: 60),
                      ],
                    )
                  ),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      color: Color(0xffB4B4B4),
                      size: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "$views",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        color: Color(0xffB4B4B4),
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => comment_on_video_widget()));
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.comment_outlined,
                            color: Color(0xffB4B4B4),
                            size: 25,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "780 Comments",
                            style: GoogleFonts.raleway(
                              fontSize: 13,
                              color: Color(0xffB4B4B4),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0.8,
          height: 1.5,
        )
      ],
    );
  }
}


class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Playing Video")),
      body: Center(
        child: _isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
