import 'dart:convert';

UploadVideoModel taskModelFromJson(String str) =>
    UploadVideoModel.fromJson(json.decode(str));

String taskModelToJson(UploadVideoModel data) => json.encode(data.toJson());

class UploadVideoModel {
  final String? uploadVideo;
  final String? uploadThumbnail;
  final String? videoTitle;
  final String? videoDescription;
  final String? docId;
  final int? views;
  final String? createdAt;

  UploadVideoModel({
    this.uploadVideo,
    this.uploadThumbnail,
    this.videoTitle,
    this.videoDescription,
    this.docId,
    this.views,
    this.createdAt,
  });

  factory UploadVideoModel.fromJson(Map<String, dynamic> json) =>
      UploadVideoModel(
        uploadVideo: json["uploadVideo"],
        uploadThumbnail: json["uploadThumbnail"],
        videoTitle: json["videoTitle"],
        videoDescription: json["videoDescription"],
        docId: json["docId"],
        views: json["views"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
    "uploadVideo": uploadVideo,
    "uploadThumbnail": uploadThumbnail,
    "videoTitle": videoTitle,
    "videoDescription": videoDescription,
    "docId": docId,
    "views": views,
    "createdAt": createdAt,
  };
}
