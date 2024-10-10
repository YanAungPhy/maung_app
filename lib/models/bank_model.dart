class BankModel {
  int? id;
  String? name;
  String? imageLink;
  String? description;
  List<String>? phoneNoList;
  String? status;
  int? createdDateInMilliSeconds;
  int? updatedDateInMilliSeconds;

  BankModel(
      {this.id,
      this.name,
      this.imageLink,
      this.description,
      this.phoneNoList,
      this.status,
      this.createdDateInMilliSeconds,
      this.updatedDateInMilliSeconds});

  BankModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['imageLink'];
    description = json['description'];
    phoneNoList = json['phoneNoList'].cast<String>();
    status = json['status'];
    createdDateInMilliSeconds = json['createdDateInMilliSeconds'];
    updatedDateInMilliSeconds = json['updatedDateInMilliSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageLink'] = this.imageLink;
    data['description'] = this.description;
    data['phoneNoList'] = this.phoneNoList;
    data['status'] = this.status;
    data['createdDateInMilliSeconds'] = this.createdDateInMilliSeconds;
    data['updatedDateInMilliSeconds'] = this.updatedDateInMilliSeconds;
    return data;
  }
}
