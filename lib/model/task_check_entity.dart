import 'dart:convert';

class TaskCheckEntity {
  TaskCheckEntity(
      {this.createdAt,
      this.createdBy,
      this.id,
      this.serialDayNum,
      this.taskId,
      this.todayNum,
      this.updatedAt,
      this.updatedBy,
      this.userId,
      this.validDay,
      this.version});

  String createdAt;
  String createdBy;
  dynamic id;
  dynamic serialDayNum;
  String taskId;
  int todayNum;
  String updatedAt;
  String updatedBy;
  dynamic userId;
  dynamic validDay;
  dynamic version;

  factory TaskCheckEntity.fromJson(Map<String, dynamic> json) =>
      TaskCheckEntity(
          createdAt: json["createdAt"],
          createdBy: json["createdBy"],
          id: json["id"],
          serialDayNum: json["serialDayNum"],
          taskId: json["taskId"],
          todayNum: json["todayNum"],
          updatedAt: json["updatedAt"],
          updatedBy: json["updatedBy"],
          userId: json["userId"],
          validDay: json["validDay"],
          version: json["version"]);

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "createdBy": createdAt,
        "id": id,
        "serialDayNum": serialDayNum,
        "taskId": taskId,
        "todayNum": todayNum,
        "updatedAt": updatedAt,
        "updatedBy": updatedBy,
        "userId": userId,
        "validDay": validDay,
        "version": version
      };

  static List<TaskCheckEntity> taskTypesFromJson(String str) =>
      List<TaskCheckEntity>.from(
          json.decode(str).map((x) => TaskCheckEntity.fromJson(x)));

  static String taskTypesToJson(List<TaskCheckEntity> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
