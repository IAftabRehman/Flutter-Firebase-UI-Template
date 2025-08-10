import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_first_task/Data/Models/answeringModel.dart';

class AnsweringServices {
  Future comment_on_post(AnsweringModel model) async {
    return FirebaseFirestore.instance
        .collection("postComments")
        .add(model.toJson());
  }

  Future comment_on_video(AnsweringModel model) async {
    return FirebaseFirestore.instance
        .collection("videoComments")
        .add(model.toJson());
  }

  final uid = FirebaseAuth.instance.currentUser?.uid;

  Future<String> currentVideoCommentUserName() async {
    if (uid == null) return "Unknown User";

    final snapshot = await FirebaseFirestore.instance
        .collection('createAccount')
        .doc(uid)
        .get();

    if (snapshot.exists) {
      return snapshot.data()?['name'] ?? "Unknown User";
    }
    return "Unknown User";
  }

  Future<String> currentVideoCommentProfileImage() async {
    if (uid == null) return "assets/images/questions_profile_1.jpg";

    final snapshot = await FirebaseFirestore.instance
        .collection('createAccount')
        .doc(uid)
        .get();

    if (snapshot.exists) {
      return snapshot.data()?['profileImage'] ??
          "assets/images/questions_profile_1.jpg";
    }
    return "assets/images/questions_profile_1.jpg";
  }

  Stream<QuerySnapshot> getComments() {
    return FirebaseFirestore.instance.collection('videoComments').snapshots();
  }

}
