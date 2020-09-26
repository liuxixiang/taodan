class UserInfoEntity {
  String userId;
  String inviteCode;
  String status;
  String name;
  String mobileNo;
  String six;
  int level;
  String avatarImage;

  UserInfoEntity(
      {this.userId,
      this.inviteCode,
      this.status,
      this.name,
      this.mobileNo,
      this.six,
      this.level,
      this.avatarImage});

  UserInfoEntity.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    inviteCode = json['inviteCode'];
    status = json['status'];
    name = json['name'];
    mobileNo = json['mobileNo'];
    six = json['six'];
    level = json['level'];
    avatarImage = json['avatarImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['inviteCode'] = this.inviteCode;
    data['status'] = this.status;
    data['name'] = this.name;
    data['mobileNo'] = this.mobileNo;
    data['six'] = this.six;
    data['level'] = this.level;
    data['avatarImage'] = this.avatarImage;
    return data;
  }
}
