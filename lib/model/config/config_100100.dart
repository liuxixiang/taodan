class Config100100 {
  Config100100(
      {this.url,
      this.desc,
      this.icon,
      this.sort,
      this.type,
      this.round,
      this.title,
      this.dataId,
      this.btnImage,
      this.btnTitle,
      this.taskId});

  String url;
  String desc;
  String icon;
  dynamic sort;
  dynamic type;
  dynamic round;
  String title;
  String dataId;
  String btnImage;
  String btnTitle;
  String taskId;

  factory Config100100.fromJson(Map<String, dynamic> json) => Config100100(
      url: json["url"],
      desc: json["desc"],
      icon: json["icon"],
      sort: json["sort"],
      type: json["type"],
      round: json["round"],
      title: json["title"],
      dataId: json["dataId"],
      btnImage: json["btnImage"],
      btnTitle: json["btnTitle"],
      taskId: json["taskId"]);

  static List<Config100100> fromJsonList(List<dynamic> str) =>
      str.map((e) => Config100100.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
        "url": url,
        "desc": desc,
        "icon": icon,
        "sort": sort,
        "type": type,
        "round": round,
        "title": title,
        "dataId": dataId,
        "btnImage": btnImage,
        "btnTitle": btnTitle,
        "taskId": taskId
      };
}
