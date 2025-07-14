import 'dart:convert';

RegistrationModel taskModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String taskModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
  final String? name;
  final String? email;
  final String? password;
  final String? docId;
  final String? profileImage;
  final String? expertise;
  final String? qualification;
  final String? latestDegree;
  final String? address;
  final String? contact;

  RegistrationModel({
    this.name,
    this.email,
    this.password,
    this.docId,
    this.profileImage,
    this.expertise,
    this.qualification,
    this.latestDegree,
    this.address,
    this.contact,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    docId: json["docId"],
    profileImage: json["profileImage"],
    expertise: json["expertise"],
    qualification: json["qualification"],
    latestDegree: json["latestDegree"],
    address: json["address"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "docId": docId,
    "profileImage": profileImage,
    "expertise": expertise,
    "qualification": qualification,
    "latestDegree": latestDegree,
    "address": address,
    "contact": contact,
  };
}
