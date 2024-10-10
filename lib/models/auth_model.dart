class AuthModel {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  UserModel? user;

  AuthModel({this.accessToken, this.tokenType, this.refreshToken, this.user});

  AuthModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['tokenType'] = this.tokenType;
    data['refreshToken'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserModel {
  int? id;
  String? name;
  String? phoneNo;
  String? secretName;
  String? type;
  String? status;
  double? balance;
  String? createdBy;
  int? createdDateInMilliSeconds;
  String? updatedBy;
  int? updatedDateInMilliSeconds;

  UserModel(
      {this.id,
        this.name,
        this.phoneNo,
        this.secretName,
        this.type,
        this.status,
        this.balance,
        this.createdBy,
        this.createdDateInMilliSeconds,
        this.updatedBy,
        this.updatedDateInMilliSeconds});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    secretName = json['secretName'];
    type = json['type'];
    status = json['status'];
    balance = json['balance'];
    createdBy = json['createdBy'];
    createdDateInMilliSeconds = json['createdDateInMilliSeconds'];
    updatedBy = json['updatedBy'];
    updatedDateInMilliSeconds = json['updatedDateInMilliSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phoneNo'] = this.phoneNo;
    data['email'] = this.secretName;
    data['type'] = this.type;
    data['status'] = this.status;
    data['balance'] = this.balance;
    data['createdBy'] = this.createdBy;
    data['createdDateInMilliSeconds'] = this.createdDateInMilliSeconds;
    data['updatedBy'] = this.updatedBy;
    data['updatedDateInMilliSeconds'] = this.updatedDateInMilliSeconds;
    return data;
  }
}
