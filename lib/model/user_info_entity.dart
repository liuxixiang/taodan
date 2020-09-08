class UserInfoEntity {
  UserInfoEntity({
    this.userId,
    this.inviteCode,
    this.status,
    this.name,
    this.six,
    this.level,
  });

  String userId;
  String inviteCode;
  String status;
  dynamic name;
  dynamic six;
  int level;

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => UserInfoEntity(
    userId: json["userId"],
    inviteCode: json["inviteCode"],
    status: json["status"],
    name: json["name"],
    six: json["six"],
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "inviteCode": inviteCode,
    "status": status,
    "name": name,
    "six": six,
    "level": level,
  };
}
