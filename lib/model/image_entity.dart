// To parse this JSON data, do
//
//     final imageEntity = imageEntityFromJson(jsonString);

import 'dart:convert';

ImageEntity imageEntityFromJson(String str) =>
    ImageEntity.fromJson(json.decode(str));

String imageEntityToJson(ImageEntity data) => json.encode(data.toJson());

class ImageEntity {
  ImageEntity({
    this.img,
    this.thumbnail,
    this.width,
    this.height,
  });

  String img;
  String thumbnail;
  int width;
  int height;

  factory ImageEntity.fromJson(Map<String, dynamic> json) => ImageEntity(
        img: json["img"],
        thumbnail: json["thumbnail"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "thumbnail": thumbnail,
        "width": width,
        "height": height,
      };
}
