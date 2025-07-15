import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intership_first_task/Data/Models/uploadPostModel.dart';

class UploadPostServices {
  Future UploadPost(UploadPostModel model) async {
    return FirebaseFirestore.instance
        .collection("createPosts")
        .add(model.toJson());
  }

  Stream<QuerySnapshot> getComments(String extraId) {
    return FirebaseFirestore.instance
        .collection('createPosts')
        .snapshots();
  }
}
