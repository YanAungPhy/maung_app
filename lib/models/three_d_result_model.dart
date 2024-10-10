class ThreeDResultModel {
  String? result;
  String? datetime;

  ThreeDResultModel({this.result, this.datetime});

  ThreeDResultModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['datetime'] = this.datetime;
    return data;
  }
}
