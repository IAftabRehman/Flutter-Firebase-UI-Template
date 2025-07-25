import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_first_task/Data/Models/answeringModel.dart';

class AnsweringServices {
  Future getAnswer(AnsweringModel model) async {
    return FirebaseFirestore.instance
        .collection("getAnswer")
        .add(model.toJson());
  }
}
