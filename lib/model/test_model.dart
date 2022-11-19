import 'dart:convert';

List<TestModel> testModelFromJson(String str) =>
    List<TestModel>.from(json.decode(str).map((x) => TestModel.fromJson(x)));

String testModelToJson(List<TestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestModel {
  final String? id;
  final String? category;
  final String? audio;
  final String? answer;

  TestModel({
    this.id,
    this.category,
    this.audio,
    this.answer,
  });

  TestModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        category = json['category'] as String?,
        audio = json['audio'] as String?,
        answer = json['answer'] as String?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'category': category, 'audio': audio, 'answer': answer};
}
