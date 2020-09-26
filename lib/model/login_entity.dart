import 'package:taodan/model/user_info_entity.dart';

class LoginEntity {
  String userId;
  String code;
  UserInfoEntity userInfoRspDto;
  String token;
  String secretKey;

  LoginEntity(
      {this.userId,
        this.code,
        this.userInfoRspDto,
        this.token,
        this.secretKey});

  LoginEntity.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    code = json['code'];
    userInfoRspDto = json['userInfoRspDto'] != null
        ? new UserInfoEntity.fromJson(json['userInfoRspDto'])
        : null;
    token = json['token'];
    secretKey = json['secretKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['code'] = this.code;
    if (this.userInfoRspDto != null) {
      data['userInfoRspDto'] = this.userInfoRspDto.toJson();
    }
    data['token'] = this.token;
    data['secretKey'] = this.secretKey;
    return data;
  }
}
