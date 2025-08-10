import 'dart:convert';

AnsweringModel taskModelFromJson(String str) => AnsweringModel.fromJson(json.decode(str));

String taskModelToJson(AnsweringModel data) => json.encode(data.toJson());

class AnsweringModel {
  final String? name;
  final String? createdAt;
  final String? answering;
  final String? docId;
  final String? profileImage;


  AnsweringModel({
    this.name,
    this.createdAt,
    this.answering,
    this.docId,
    this.profileImage
  });

  factory AnsweringModel.fromJson(Map<String, dynamic> json) => AnsweringModel(
    name: json["name"],
    createdAt: json["createdAt"],
    answering: json["answering"],
    docId: json["docId"],
    profileImage: json['profileImage']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "createdAt": createdAt,
    "answering": answering,
    "docId": docId,
    "profileImage": profileImage
  };

}
