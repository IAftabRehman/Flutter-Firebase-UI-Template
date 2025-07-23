import 'dart:convert';

RegistrationModel taskModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String taskModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
  final String? name;
  final String? email;
  final String? password;
  final String? profileImage;
  final String? expertise;
  final String? qualification;
  final String? degreeImage;
  final String? address;
  final String? contact;
  final String? docId;
  final String? createdAt;

  RegistrationModel({
    this.name,
    this.email,
    this.password,
    this.docId,
    this.profileImage,
    this.expertise,
    this.qualification,
    this.degreeImage,
    this.address,
    this.contact,
    this.createdAt
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    profileImage: json["profileImage"],
    expertise: json["expertise"],
    qualification: json["qualification"],
    degreeImage: json["latestDegree"],
    address: json["address"],
    contact: json["contact"],
    docId: json["docId"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "profileImage": profileImage,
    "expertise": expertise,
    "qualification": qualification,
    "latestDegree": degreeImage,
    "address": address,
    "contact": contact,
    "docId": docId,
    "createdAt" : createdAt
  };
}
