// To parse this JSON data, do
//
//     final titleModel = titleModelFromJson(jsonString);

import 'dart:convert';

List<TitleModel> titleModelFromJson(String str) => List<TitleModel>.from(json.decode(str).map((x) => TitleModel.fromJson(x)));

String titleModelToJson(List<TitleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TitleModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TitleModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory TitleModel.fromJson(Map<String, dynamic> json) => TitleModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}

