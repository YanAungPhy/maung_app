class WinNumModel {
  int? result;
  String? message;
  Data? data;

  WinNumModel({this.result, this.message, this.data});

  WinNumModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? set1100;
  String? val1100;
  String? set1200;
  String? val1200;
  String? set300;
  String? val300;
  String? set430;
  String? val430;
  String? result1100;
  String? result1200;
  String? result300;
  String? result430;
  String? internet930;
  String? modern930;
  String? internet200;
  String? modern200;
  String? date;
  String? time1200;
  String? time430;
  String? live;
  String? liveSet;
  String? liveVal;
  String? status1200;
  String? status430;
  String? lastDate;
  String? isCloseDay;
  String? currentDate;
  String? currentTime;

  Data(
      {this.set1100,
      this.val1100,
      this.set1200,
      this.val1200,
      this.set300,
      this.val300,
      this.set430,
      this.val430,
      this.result1100,
      this.result1200,
      this.result300,
      this.result430,
      this.internet930,
      this.modern930,
      this.internet200,
      this.modern200,
      this.date,
      this.time1200,
      this.time430,
      this.live,
      this.liveSet,
      this.liveVal,
      this.status1200,
      this.status430,
      this.lastDate,
      this.isCloseDay,
      this.currentDate,
      this.currentTime});

  Data.fromJson(Map<String, dynamic> json) {
    set1100 = json['set_1100'].toString();
    val1100 = json['val_1100'].toString();
    set1200 = json['set_1200'].toString();
    val1200 = json['val_1200'].toString();
    set300 = json['set_300'].toString();
    val300 = json['val_300'].toString();
    set430 = json['set_430'].toString();
    val430 = json['val_430'].toString();
    result1100 = json['result_1100'].toString();
    result1200 = json['result_1200'].toString();
    result300 = json['result_300'].toString();
    result430 = json['result_430'].toString();
    internet930 = json['internet_930'].toString();
    modern930 = json['modern_930'].toString();
    internet200 = json['internet_200'].toString();
    modern200 = json['modern_200'].toString();
    date = json['date'].toString();
    time1200 = json['time_1200'].toString();
    time430 = json['time_430'].toString();
    live = json['live'].toString();
    liveSet = json['live_set'].toString();
    liveVal = json['live_val'].toString();
    status1200 = json['status_1200'].toString();
    status430 = json['status_430'].toString();
    lastDate = json['last_date'].toString();
    isCloseDay = json['is_close_day'].toString();
    currentDate = json['current_date'].toString();
    currentTime = json['current_time'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_1100'] = this.set1100;
    data['val_1100'] = this.val1100;
    data['set_1200'] = this.set1200;
    data['val_1200'] = this.val1200;
    data['set_300'] = this.set300;
    data['val_300'] = this.val300;
    data['set_430'] = this.set430;
    data['val_430'] = this.val430;
    data['result_1100'] = this.result1100;
    data['result_1200'] = this.result1200;
    data['result_300'] = this.result300;
    data['result_430'] = this.result430;
    data['internet_930'] = this.internet930;
    data['modern_930'] = this.modern930;
    data['internet_200'] = this.internet200;
    data['modern_200'] = this.modern200;
    data['date'] = this.date;
    data['time_1200'] = this.time1200;
    data['time_430'] = this.time430;
    data['live'] = this.live;
    data['live_set'] = this.liveSet;
    data['live_val'] = this.liveVal;
    data['status_1200'] = this.status1200;
    data['status_430'] = this.status430;
    data['last_date'] = this.lastDate;
    data['is_close_day'] = this.isCloseDay;
    data['current_date'] = this.currentDate;
    data['current_time'] = this.currentTime;
    return data;
  }
}
