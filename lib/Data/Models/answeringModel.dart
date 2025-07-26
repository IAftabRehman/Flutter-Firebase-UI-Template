import 'dart:convert';

AnsweringModel taskModelFromJson(String str) => AnsweringModel.fromJson(json.decode(str));

String taskModelToJson(AnsweringModel data) => json.encode(data.toJson());

class AnsweringModel {
  final String? name;
  final String? createdAt;
  final String? answering;
  final String? docId;


  AnsweringModel({
    this.name,
    this.createdAt,
    this.answering,
    this.docId,
  });

  factory AnsweringModel.fromJson(Map<String, dynamic> json) => AnsweringModel(
    name: json["name"],
    createdAt: json["createdAt"],
    answering: json["answering"],
    docId: json["docId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "createdAt": createdAt,
    "answering": answering,
    "docId": docId,
  };

}
