class BreederEntity {
  bool needPaging;
  List<BreederInfoEntity> result;
  String map;
  int page;
  int pageSize;
  int size;

  BreederEntity(
      {this.needPaging,
        this.result,
        this.map,
        this.page,
        this.pageSize,
        this.size});

  BreederEntity.fromJson(Map<String, dynamic> json) {
    needPaging = json['needPaging'];
    if (json['result'] != null) {
      result = new List<BreederInfoEntity>();
      json['result'].forEach((v) {
        result.add(new BreederInfoEntity.fromJson(v));
      });
    }
    map = json['map'];
    page = json['page'];
    pageSize = json['page_size'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['needPaging'] = this.needPaging;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['map'] = this.map;
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    data['size'] = this.size;
    return data;
  }
}

class BreederInfoEntity {
  String userId;
  String status;
  String breederType;
  String name;
  int outPutGoldIngot;
  int baseOut;
  String startDate;
  String endDate;
  String hasOutPutGoldIngot;
  int hirePrice;
  int hireNum;
  String getType;
  String validityDate;
  String userHireNum;

  BreederInfoEntity(
      {this.userId,
        this.status,
        this.breederType,
        this.name,
        this.outPutGoldIngot,
        this.baseOut,
        this.startDate,
        this.endDate,
        this.hasOutPutGoldIngot,
        this.hirePrice,
        this.hireNum,
        this.getType,
        this.validityDate,
        this.userHireNum});

  BreederInfoEntity.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    status = json['status'];
    breederType = json['breederType'];
    name = json['name'];
    outPutGoldIngot = json['outPutGoldIngot'];
    baseOut = json['baseOut'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    hasOutPutGoldIngot = json['hasOutPutGoldIngot'];
    hirePrice = json['hirePrice'];
    hireNum = json['hireNum'];
    getType = json['getType'];
    validityDate = json['validityDate'];
    userHireNum = json['userHireNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['status'] = this.status;
    data['breederType'] = this.breederType;
    data['name'] = this.name;
    data['outPutGoldIngot'] = this.outPutGoldIngot;
    data['baseOut'] = this.baseOut;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['hasOutPutGoldIngot'] = this.hasOutPutGoldIngot;
    data['hirePrice'] = this.hirePrice;
    data['hireNum'] = this.hireNum;
    data['getType'] = this.getType;
    data['validityDate'] = this.validityDate;
    data['userHireNum'] = this.userHireNum;
    return data;
  }
}
