// To parse this JSON data, do
//
//     final userInfoEntity = userInfoEntityFromJson(jsonString);

import 'dart:convert';

import 'package:taodan/model/user_info_entity.dart';

UserInfoAllEntity userInfoAllEntityFromJson(String str) => UserInfoAllEntity.fromJson(json.decode(str));

String userInfoAllEntityToJson(UserInfoAllEntity data) => json.encode(data.toJson());

class UserInfoAllEntity {
  UserInfoAllEntity({
    this.userInfoRspDto,
    this.userChickenInfoRspDto,
  });

  UserInfoEntity userInfoRspDto;
  dynamic userChickenInfoRspDto;

  factory UserInfoAllEntity.fromJson(Map<String, dynamic> json) => UserInfoAllEntity(
        userInfoRspDto: UserInfoEntity.fromJson(json["userInfoRspDto"]),
        userChickenInfoRspDto: json["userChickenInfoRspDto"],
      );

  Map<String, dynamic> toJson() => {
        "userInfoRspDto": userInfoRspDto.toJson(),
        "userChickenInfoRspDto": userChickenInfoRspDto,
      };
}
