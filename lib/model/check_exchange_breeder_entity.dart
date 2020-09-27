class CheckExchangeBreederEntity {
  String canHiriCount;
  String hirePrice;
  String remainGoldCount;

  CheckExchangeBreederEntity(
      {this.canHiriCount, this.hirePrice, this.remainGoldCount});

  CheckExchangeBreederEntity.fromJson(Map<String, dynamic> json) {
    canHiriCount = json['canHiriCount'];
    hirePrice = json['hirePrice'];
    remainGoldCount = json['remainGoldCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['canHiriCount'] = this.canHiriCount;
    data['hirePrice'] = this.hirePrice;
    data['remainGoldCount'] = this.remainGoldCount;
    return data;
  }
}
