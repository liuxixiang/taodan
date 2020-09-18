import 'package:flutter/material.dart';
import 'dart:convert';

class TaskType {
  TaskType(
      {this.url,
      this.desc,
      this.icon,
      this.sort,
      this.type,
      this.round,
      this.title,
      this.dataId,
      this.btnImage,
      this.btnTitle,
      this.taskId});

  String url;
  String desc;
  String icon;
  dynamic sort;
  dynamic type;
  dynamic round;
  String title;
  String dataId;
  String btnImage;
  String btnTitle;
  String taskId;

  factory TaskType.fromJson(Map<String, dynamic> json) => TaskType(
      url: json["url"],
      desc: json["desc"],
      icon: json["icon"],
      sort: json["sort"],
      type: json["type"],
      round: json["round"],
      title: json["title"],
      dataId: json["dataId"],
      btnImage: json["btnImage"],
      btnTitle: json["btnTitle"],
      taskId: json["taskId"]);

  Map<String, dynamic> toJson() => {
        "url": url,
        "desc": desc,
        "icon": icon,
        "sort": sort,
        "type": type,
        "round": round,
        "title": title,
        "dataId": dataId,
        "btnImage": btnImage,
        "btnTitle": btnTitle,
        "taskId": taskId
      };

  static List<TaskType> taskTypesFromJson(String str) =>
      List<TaskType>.from(json.decode(str).map((x) => TaskType.fromJson(x)));

  static List<TaskType> taskTypesFromList(List<dynamic> str) =>
      str.map((e) => TaskType.fromJson(e)).toList();
  // List<TaskType>.from(str).map((x) => TaskType.fromJson(x));

  static String taskTypesToJson(List<TaskType> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
