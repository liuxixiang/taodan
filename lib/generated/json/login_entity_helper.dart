import 'package:taodan/model/login_entity.dart';

loginEntityFromJson(LoginEntity data, Map<String, dynamic> json) {
	if (json['auth'] != null) {
		data.auth = json['auth']?.toString();
	}
	if (json['account'] != null) {
		data.account = new LoginAccount().fromJson(json['account']);
	}
	return data;
}

Map<String, dynamic> loginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['auth'] = entity.auth;
	if (entity.account != null) {
		data['account'] = entity.account.toJson();
	}
	return data;
}

loginAccountFromJson(LoginAccount data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['nickName'] != null) {
		data.nickName = json['nickName']?.toString();
	}
	if (json['mobilePhone'] != null) {
		data.mobilePhone = json['mobilePhone']?.toString();
	}
	if (json['cerStatus'] != null) {
		data.cerStatus = json['cerStatus'];
	}
	if (json['level'] != null) {
		data.level = json['level']?.toString();
	}
	if (json['invitationCode'] != null) {
		data.invitationCode = json['invitationCode']?.toString();
	}
	if (json['secretKey'] != null) {
		data.secretKey = json['secretKey']?.toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toString();
	}
	if (json['wxAccount'] != null) {
		data.wxAccount = json['wxAccount']?.toString();
	}
	if (json['hasExchangePwd'] != null) {
		data.hasExchangePwd = json['hasExchangePwd'];
	}
	if (json['accountStatus'] != null) {
		data.accountStatus = json['accountStatus']?.toString();
	}
	if (json['accountRole'] != null) {
		data.accountRole = json['accountRole']?.toString();
	}
	return data;
}

Map<String, dynamic> loginAccountToJson(LoginAccount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['avatar'] = entity.avatar;
	data['nickName'] = entity.nickName;
	data['mobilePhone'] = entity.mobilePhone;
	data['cerStatus'] = entity.cerStatus;
	data['level'] = entity.level;
	data['invitationCode'] = entity.invitationCode;
	data['secretKey'] = entity.secretKey;
	data['gender'] = entity.gender;
	data['wxAccount'] = entity.wxAccount;
	data['hasExchangePwd'] = entity.hasExchangePwd;
	data['accountStatus'] = entity.accountStatus;
	data['accountRole'] = entity.accountRole;
	return data;
}