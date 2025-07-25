import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_first_task/Data/Models/uploadPostModel.dart';

class UploadPostServices {
  Future UploadPost(UploadPostModel model) async {
    return FirebaseFirestore.instance
        .collection("createPosts")
        .add(model.toJson());
  }

  Stream<QuerySnapshot> getComments(String extraId) {
    return FirebaseFirestore.instance.collection('createPost').snapshots();
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
