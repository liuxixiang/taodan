class EggEntity {
  int feedNeededForUpgrade = 0;
  int feedSchedule = 0;
  int userEggTotal = 0;

  EggEntity({this.feedNeededForUpgrade, this.feedSchedule, this.userEggTotal});

  factory EggEntity.fromJson(Map<String, dynamic> json) => EggEntity(
      feedNeededForUpgrade: json["feedNeededForUpgrade"] ?? 0,
      feedSchedule: json["feedSchedule"] ?? 0,
      userEggTotal: json["userEggTotal"] ?? 0);

  Map<String, dynamic> toJson() => {
        "feedNeededForUpgrade": feedNeededForUpgrade,
        "feedSchedule": feedSchedule,
        "userEggTotal": userEggTotal
      };
  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}
