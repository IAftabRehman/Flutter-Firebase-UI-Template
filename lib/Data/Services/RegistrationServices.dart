import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

import 'package:internship_first_task/Data/Models/registrationModel.dart';

class RegistrationServices{
  Future createAccount(RegistrationModel model) async {
    return await FirebaseFirestore.instance
        .collection('createAccount')
        .add(model.toJson());
  }

  static const String imgbbApiKey = "Your Own API";
  static Future<String?> uploadImageToImgbb(File imageFile) async {
    try {
      final url = Uri.parse("https://api.imgbb.com/1/upload?key=$imgbbApiKey");
      final base64Image = base64Encode(await imageFile.readAsBytes());
      final response = await http.post(
        url,
        body: {
          "image": base64Image,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final imageUrl = data['data']['url'];
        return imageUrl;
      } else {
        print("Failed to upload image: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }


}