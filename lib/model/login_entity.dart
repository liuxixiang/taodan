// To parse this JSON data, do
//
//     final loginEntity = loginEntityFromJson(jsonString);

import 'dart:convert';

import 'package:taodan/model/user_info_entity.dart';

LoginEntity loginEntityFromJson(String str) =>
    LoginEntity.fromJson(json.decode(str));

String loginEntityToJson(LoginEntity data) => json.encode(data.toJson());

class LoginEntity {
  LoginEntity({
    this.userId,
    this.inviteCode,
    this.bindInviteFlag,
    this.userInfoRspDto,
    this.token,
    this.secretKey,
  });

  String userId;
  String inviteCode;
  bool bindInviteFlag;
	UserInfoEntity userInfoRspDto;
  String token;
  String secretKey;

  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
        userId: json["userId"],
        inviteCode: json["inviteCode"],
        bindInviteFlag: json["bindInviteFlag"],
        userInfoRspDto: UserInfoEntity.fromJson(json["userInfoRspDto"]),
        token: json["token"],
        secretKey: json["secretKey"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "inviteCode": inviteCode,
        "bindInviteFlag": bindInviteFlag,
        "userInfoRspDto": userInfoRspDto.toJson(),
        "token": token,
        "secretKey": secretKey,
      };
}
