class EggEntity {
  int feedNeededForUpgrade;
  int feedSchedule;
  int userEggTotal;
  EggEntity({this.feedNeededForUpgrade, this.feedSchedule, this.userEggTotal});

  factory EggEntity.fromJson(Map<String, dynamic> json) => EggEntity(
      feedNeededForUpgrade: json["feedNeededForUpgrade"],
      feedSchedule: json["feedSchedule"],
      userEggTotal: json["userEggTotal"]);

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
