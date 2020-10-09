class BaseConfigEntity {
  dynamic paramValue;
  int configVersion;

  BaseConfigEntity({this.paramValue, this.configVersion});

  BaseConfigEntity.fromJson(Map<String, dynamic> json) {
    paramValue = json['paramValue'];
    configVersion = json['configVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paramValue'] = this.paramValue;
    data['configVersion'] = this.configVersion;
    return data;
  }
}
