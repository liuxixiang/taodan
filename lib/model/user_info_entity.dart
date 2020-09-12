class UserInfoEntity {
  UserInfoEntity({
    this.userId,
    this.inviteCode,
    this.status,
    this.name,
    this.six,
    this.level,
    this.mobileNo,
    this.avatarImage,
  });

  String userId;
  String inviteCode;
  String status;
  String name;
  String six;
  int level;
  String mobileNo;
  String avatarImage;

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => UserInfoEntity(
    userId: json["userId"],
    inviteCode: json["inviteCode"],
    status: json["status"],
    name: json["name"],
    six: json["six"],
    level: json["level"],
    mobileNo: json["mobileNo"],
    avatarImage: json["avatarImage"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "inviteCode": inviteCode,
    "status": status,
    "name": name,
    "six": six,
    "level": level,
    "mobileNo": mobileNo,
    "avatarImage": avatarImage,
  };
}
