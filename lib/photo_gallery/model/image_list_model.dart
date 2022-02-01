import 'dart:convert';

List<ImageListModel> imageListModelFromJson(String str) =>
    List<ImageListModel>.from(
        json.decode(str).map((x) => ImageListModel.fromJson(x)));

String imageListModelToJson(List<ImageListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageListModel {
  ImageListModel({
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

  factory ImageListModel.fromJson(Map<String, dynamic> json) => ImageListModel(
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
