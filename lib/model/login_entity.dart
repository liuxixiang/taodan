import 'package:taodan/generated/json/base/json_convert_content.dart';

class LoginEntity with JsonConvert<LoginEntity> {
	String auth;
	LoginAccount account;
}

class LoginAccount with JsonConvert<LoginAccount> {
	String id;
	String avatar;
	String nickName;
	String mobilePhone;
	bool cerStatus;
	String level;
	String invitationCode;
	String secretKey;
	String gender;
	String wxAccount;
	bool hasExchangePwd;
	String accountStatus;
	String accountRole;
}
