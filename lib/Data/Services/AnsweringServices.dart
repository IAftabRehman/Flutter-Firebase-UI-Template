import 'package:cloud_firestore/cloud_firestore.dart';
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
}
