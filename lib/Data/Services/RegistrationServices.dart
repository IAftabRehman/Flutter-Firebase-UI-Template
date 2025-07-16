import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_first_task/Data/Models/registrationModel.dart';

class RegistrationServices{
  Future createAccount(RegistrationModel model) async {
    return await FirebaseFirestore.instance
        .collection('createAccount')
        .add(model.toJson());
  }
}