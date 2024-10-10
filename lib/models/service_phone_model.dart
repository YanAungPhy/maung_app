class ServicePhoneModel {
  int? id;
  String? name;
  String? value;
  int? updatedDateInMilliSeconds;

  ServicePhoneModel(
      {this.id, this.name, this.value, this.updatedDateInMilliSeconds});

  ServicePhoneModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    updatedDateInMilliSeconds = json['updatedDateInMilliSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['value'] = value;
    data['updatedDateInMilliSeconds'] = updatedDateInMilliSeconds;
    return data;
  }
}
