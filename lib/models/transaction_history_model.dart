class TransactionHistoryListModel {
  List<TransactionHistoryModel>? list;
  int? page;
  int? size;
  int? numberofElements;
  int? totalElements;
  int? totalPages;

  TransactionHistoryListModel(
      {this.list,
      this.page,
      this.size,
      this.numberofElements,
      this.totalElements,
      this.totalPages});

  TransactionHistoryListModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <TransactionHistoryModel>[];
      json['list'].forEach((v) {
        list!.add(new TransactionHistoryModel.fromJson(v));
      });
    }
    page = json['page'];
    size = json['size'];
    numberofElements = json['numberofElements'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['tlist'] = this.list!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['size'] = this.size;
    data['numberofElements'] = this.numberofElements;
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class TransactionHistoryModel {
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

  TransactionHistoryModel(
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

  TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
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
