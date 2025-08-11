import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:internship_first_task/Data/Models/uploadVideoModel.dart';

class UploadVideoServices {
  Future uploadVideo(UploadVideoModel model) async {
    return FirebaseFirestore.instance
        .collection("uploadVideo")
        .add(model.toJson());
  }

  Future updateViews(String docId, int views) async {
    return await FirebaseFirestore.instance
        .collection('uploadVideo')
        .doc(docId)
        .update({'views': views});
  }

  Future<String?> uploadVideoToCloudinary(File videoFile) async {
    final cloudName = 'your own cloudery';
    final uploadPreset = 'internship_first_task';
    final uri = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/video/upload");

    var request = http.MultipartRequest('POST', uri)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', videoFile.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final data = jsonDecode(responseData);
      return data['secure_url'];
    } else {
      print('Upload failed with status: ${response.statusCode}');
      return null;
    }
  }




  Stream<QuerySnapshot> gettingVideos() {
    return FirebaseFirestore.instance.collection('uploadVideo').snapshots();
  }

  Stream<QuerySnapshot> gettingLatestVideos() {
    return FirebaseFirestore.instance.collection('uploadVideo').orderBy('createdAt', descending: true).snapshots();
  }



  Stream<QuerySnapshot> getComments(String extraId) {
    return FirebaseFirestore.instance.collection('uploadPost').snapshots();
  }

  Stream<QuerySnapshot> getPosts() {
    return FirebaseFirestore.instance.collection('createPost').snapshots();
  }

  Stream<QuerySnapshot> getPostsWhereIsPending() {
    return FirebaseFirestore.instance
        .collection('createPost')
        .where("answer", isEqualTo: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getPostsWhereIsAnswered() {
    return FirebaseFirestore.instance
        .collection('createPost')
        .where("answer", isEqualTo: true)
        .snapshots();
  }

}