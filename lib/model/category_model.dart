// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) =>
    List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
  HomeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  String id;
  String name;
  String image;
  String type;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "type": type,
      };
}
