// To parse this JSON data, do
//
//     final loginEntity = loginEntityFromJson(jsonString);

import 'dart:convert';

LoginEntity loginEntityFromJson(String str) => LoginEntity.fromJson(json.decode(str));

String loginEntityToJson(LoginEntity data) => json.encode(data.toJson());

class LoginEntity {
	LoginEntity({
		this.auth,
		this.account,
	});

	String auth;
	Account account;

	factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
		auth: json["auth"],
		account: Account.fromJson(json["account"]),
	);

	Map<String, dynamic> toJson() => {
		"auth": auth,
		"account": account.toJson(),
	};
}

class Account {
	Account({
		this.id,
		this.avatar,
		this.nickName,
		this.mobilePhone,
		this.cerStatus,
		this.level,
		this.invitationCode,
		this.secretKey,
		this.gender,
		this.wxAccount,
		this.hasExchangePwd,
		this.accountStatus,
		this.accountRole,
	});

	String id;
	String avatar;
	String nickName;
	String mobilePhone;
	bool cerStatus;
	String level;
	String invitationCode;
	String secretKey;
	dynamic gender;
	dynamic wxAccount;
	bool hasExchangePwd;
	String accountStatus;
	dynamic accountRole;

	factory Account.fromJson(Map<String, dynamic> json) => Account(
		id: json["id"],
		avatar: json["avatar"],
		nickName: json["nickName"],
		mobilePhone: json["mobilePhone"],
		cerStatus: json["cerStatus"],
		level: json["level"],
		invitationCode: json["invitationCode"],
		secretKey: json["secretKey"],
		gender: json["gender"],
		wxAccount: json["wxAccount"],
		hasExchangePwd: json["hasExchangePwd"],
		accountStatus: json["accountStatus"],
		accountRole: json["accountRole"],
	);

	Map<String, dynamic> toJson() => {
		"id": id,
		"avatar": avatar,
		"nickName": nickName,
		"mobilePhone": mobilePhone,
		"cerStatus": cerStatus,
		"level": level,
		"invitationCode": invitationCode,
		"secretKey": secretKey,
		"gender": gender,
		"wxAccount": wxAccount,
		"hasExchangePwd": hasExchangePwd,
		"accountStatus": accountStatus,
		"accountRole": accountRole,
	};
}
