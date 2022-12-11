// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

List<TestModel> testModelFromJson(String str) =>
    List<TestModel>.from(json.decode(str).map((x) => TestModel.fromJson(x)));

String testModelToJson(List<TestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestModel {
  TestModel({
    required this.id,
    required this.category,
    required this.audio,
    required this.answer,
    required this.any,
  });

  String id;
  String category;
  String audio;
  String answer;
  String any;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        id: json["id"],
        category: json["category"],
        audio: json["audio"],
        answer: json["answer"],
        any: json["any"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "audio": audio,
        "answer": answer,
        "any": any,
      };
}
