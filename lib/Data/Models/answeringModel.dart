import 'dart:convert';

AnsweringModel taskModelFromJson(String str) => AnsweringModel.fromJson(json.decode(str));

String taskModelToJson(AnsweringModel data) => json.encode(data.toJson());

class AnsweringModel {
  final String? name;
  final String? time;
  final String? answering;
  final String? docId;


  AnsweringModel({
    this.name,
    this.time,
    this.answering,
    this.docId,
  });

  factory AnsweringModel.fromJson(Map<String, dynamic> json) => AnsweringModel(
    name: json["name"],
    time: json["time"],
    answering: json["answering"],
    docId: json["docId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "time": time,
    "answering": answering,
    "docId": docId,
  };

}
