class CarouselImgModel {
  int? id;
  String? link;
  String? status;
  int? sortNo;
  int? createdDateInMilliSeconds;
  int? updatedDateInMIlliSeconds;

  CarouselImgModel(
      {this.id,
      this.link,
      this.status,
      this.sortNo,
      this.createdDateInMilliSeconds,
      this.updatedDateInMIlliSeconds});

  CarouselImgModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    status = json['status'];
    sortNo = json['sortNo'];
    createdDateInMilliSeconds = json['createdDateInMilliSeconds'];
    updatedDateInMIlliSeconds = json['updatedDateInMIlliSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['status'] = this.status;
    data['sortNo'] = this.sortNo;
    data['createdDateInMilliSeconds'] = this.createdDateInMilliSeconds;
    data['updatedDateInMIlliSeconds'] = this.updatedDateInMIlliSeconds;
    return data;
  }
}
