// To parse this JSON data, do
//
//     final breederEntity = breederEntityFromJson(jsonString);

import 'dart:convert';

String breederEntityToJson(List<BreederEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<BreederEntity> breederEntityFromJson(List<dynamic> str) =>
    str.map((e) => BreederEntity.fromJson(e)).toList();

class BreederEntity {
  BreederEntity({
    this.userId,
    this.status,
    this.breederType,
    this.name,
    this.outPutGoldIngot,
    this.baseOut,
    this.startDate,
    this.endDate,
    this.hasOutPutGoldIngot,
    this.hirePrice,
    this.hireNum,
    this.getType,
    this.validityDate,
    this.userHireNum,
  });

  dynamic userId;
  dynamic status;
  String breederType;
  String name;
  int outPutGoldIngot;
  int baseOut;
  dynamic startDate;
  dynamic endDate;
  dynamic hasOutPutGoldIngot;
  int hirePrice;
  int hireNum;
  String getType;
  String validityDate;
  String userHireNum;

  factory BreederEntity.fromJson(Map<String, dynamic> json) => BreederEntity(
        userId: json["userId"],
        status: json["status"],
        breederType: json["breederType"],
        name: json["name"],
        outPutGoldIngot: json["outPutGoldIngot"],
        baseOut: json["baseOut"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        hasOutPutGoldIngot: json["hasOutPutGoldIngot"],
        hirePrice: json["hirePrice"],
        hireNum: json["hireNum"],
        getType: json["getType"],
        validityDate: json["validityDate"],
        userHireNum: json["userHireNum"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "status": status,
        "breederType": breederType,
        "name": name,
        "outPutGoldIngot": outPutGoldIngot,
        "baseOut": baseOut,
        "startDate": startDate,
        "endDate": endDate,
        "hasOutPutGoldIngot": hasOutPutGoldIngot,
        "hirePrice": hirePrice,
        "hireNum": hireNum,
        "getType": getType,
        "validityDate": validityDate,
        "userHireNum": userHireNum,
      };
}
