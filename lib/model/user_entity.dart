// To parse this JSON data, do
//
//     final loginEntity = loginEntityFromJson(jsonString);

import 'dart:convert';

UserInfoEntity loginEntityFromJson(String str) => UserInfoEntity.fromJson(json.decode(str));

String loginEntityToJson(UserInfoEntity data) => json.encode(data.toJson());

class UserInfoEntity {
	UserInfoEntity({
		this.userId,
		this.inviteCode,
		this.bindInviteFlag,
		this.token,
		this.secretKey,
	});

	String userId;
	String inviteCode;
	bool bindInviteFlag;
	String token;
	String secretKey;

	factory UserInfoEntity.fromJson(Map<String, dynamic> json) => UserInfoEntity(
		userId: json["userId"],
		inviteCode: json["inviteCode"],
		bindInviteFlag: json["bindInviteFlag"],
		token: json["token"],
		secretKey: json["secretKey"],
	);

	Map<String, dynamic> toJson() => {
		"userId": userId,
		"inviteCode": inviteCode,
		"bindInviteFlag": bindInviteFlag,
		"token": token,
		"secretKey": secretKey,
	};
}