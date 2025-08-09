import 'dart:convert';

UploadPostModel taskModelFromJson(String str) => UploadPostModel.fromJson(json.decode(str));
String taskModelToJson(UploadPostModel data) => json.encode(data.toJson());

class UploadPostModel {
  final String? name;
  final String? time;
  final String? caption;
  final String? docId;
  final List<String>? image;


  UploadPostModel({
    this.name,
    this.time,
    this.caption,
    this.docId,
    this.image,
  });

  factory UploadPostModel.fromJson(Map<String, dynamic> json) => UploadPostModel(
    name: json["name"],
    time: json["time"],
    caption: json["caption"],
    docId: json["docId"],
    image: json["image"] != null
        ? List<String>.from(json["image"])
        : [],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "time": time,
    "caption": caption,
    "docId": docId,
    "image": image,
  };

}
