class TransHistoryModel {
  int? id;
  String? type;
  int? paymentMethodId;
  String? paymentMethodName;
  String? transactionId;
  String? status;
  int? userId;
  String? username;
  int? createdDateInMilliSeconds;
  int? updatedDateInMilliSeconds;

  TransHistoryModel(
      {this.id,
      this.type,
      this.paymentMethodId,
      this.paymentMethodName,
      this.transactionId,
      this.status,
      this.userId,
      this.username,
      this.createdDateInMilliSeconds,
      this.updatedDateInMilliSeconds});

  TransHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    paymentMethodId = json['paymentMethodId'];
    paymentMethodName = json['paymentMethodName'];
    transactionId = json['transactionId'];
    status = json['status'];
    userId = json['userId'];
    username = json['username'];
    createdDateInMilliSeconds = json['createdDateInMilliSeconds'];
    updatedDateInMilliSeconds = json['updatedDateInMilliSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['paymentMethodId'] = this.paymentMethodId;
    data['paymentMethodName'] = this.paymentMethodName;
    data['transactionId'] = this.transactionId;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['createdDateInMilliSeconds'] = this.createdDateInMilliSeconds;
    data['updatedDateInMilliSeconds'] = this.updatedDateInMilliSeconds;
    return data;
  }
}
