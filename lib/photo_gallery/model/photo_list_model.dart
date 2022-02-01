import 'dart:convert';

List<PhotoListModel> photoListModelFromJson(String str) =>
    List<PhotoListModel>.from(
        json.decode(str).map((x) => PhotoListModel.fromJson(x)));

String photoListModelToJson(List<PhotoListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoListModel {
  PhotoListModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  factory PhotoListModel.fromJson(Map<String, dynamic> json) => PhotoListModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
