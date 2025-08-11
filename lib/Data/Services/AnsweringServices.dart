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

  // final uid = FirebaseAuth.instance.currentUser?.uid;
  String? get uid => FirebaseAuth.instance.currentUser?.uid;

  Future<String> currentVideoCommentUser_Name() async {
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
  Future<String> currentVideoCommentProfile_Image() async {
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


  Future<String> getCurrentUserName() async {
    if (uid == null) return "Unknown User";

    final snapshot = await FirebaseFirestore.instance
        .collection('createAccount')
        .where('docId', isEqualTo: uid)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.data()['name'] ?? "Unknown User";
    }
    return "Unknown User";
  }

  Future<String> getCurrentUserProfileImage() async {
    if (uid == null) return "assets/images/questions_profile_1.jpg";

    final snapshot = await FirebaseFirestore.instance
        .collection('createAccount')
        .doc(uid)
        .get();

    return snapshot.data()?['profileImage'] ??
        "assets/images/questions_profile_1.jpg";
  }


}
