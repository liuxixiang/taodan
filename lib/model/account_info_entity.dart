
// To parse this JSON data, do
//
//     final accountInfoEntity = accountInfoEntityFromJson(jsonString);

import 'dart:convert';

AccountInfoEntity accountInfoEntityFromJson(String str) => AccountInfoEntity.fromJson(json.decode(str));

String accountInfoEntityToJson(AccountInfoEntity data) => json.encode(data.toJson());

class AccountInfoEntity {
  AccountInfoEntity({
    this.todayCoinCount,
    this.goldIngotCount,
    this.cashCount,
  });

  String todayCoinCount;
  String goldIngotCount;
  String cashCount;

  factory AccountInfoEntity.fromJson(Map<String, dynamic> json) => AccountInfoEntity(
    todayCoinCount: json["todayCoinCount"],
    goldIngotCount: json["goldIngotCount"],
    cashCount: json["cashCount"],
  );

  Map<String, dynamic> toJson() => {
    "todayCoinCount": todayCoinCount,
    "goldIngotCount": goldIngotCount,
    "cashCount": cashCount,
  };
}
