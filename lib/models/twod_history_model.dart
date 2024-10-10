class TwoDHistoryModel {
  String? set1100;
  String? val1100;
  String? set1200;
  String? val1200;
  String? set430;
  String? val430;
  String? set300;
  String? val300;
  String? result1100;
  String? result1200;
  String? result300;
  String? result430;
  String? internet930;
  String? modern930;
  String? internet200;
  String? modern200;
  String? date;
  String? time1100;
  String? time1200;
  String? time300;
  String? time430;
  String? live;

  TwoDHistoryModel(
      {this.set1100,
      this.val1100,
      this.set1200,
      this.val1200,
      this.set430,
      this.val430,
      this.set300,
      this.val300,
      this.result1100,
      this.result1200,
      this.result300,
      this.result430,
      this.internet930,
      this.modern930,
      this.internet200,
      this.modern200,
      this.date,
      this.time1100,
      this.time1200,
      this.time300,
      this.time430,
      this.live});

  TwoDHistoryModel.fromJson(Map<String, dynamic> json) {
    set1100 = json['set_1100'];
    val1100 = json['val_1100'];
    set1200 = json['set_1200'];
    val1200 = json['val_1200'];
    set430 = json['set_430'];
    val430 = json['val_430'];
    set300 = json['set_300'];
    val300 = json['val_300'];
    result1100 = json['result_1100'];
    result1200 = json['result_1200'];
    result300 = json['result_300'];
    result430 = json['result_430'];
    internet930 = json['internet_930'];
    modern930 = json['modern_930'];
    internet200 = json['internet_200'];
    modern200 = json['modern_200'];
    date = json['date'];
    time1100 = json['time_1100'];
    time1200 = json['time_1200'];
    time300 = json['time_300'];
    time430 = json['time_430'];
    live = json['live'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_1100'] = this.set1100;
    data['val_1100'] = this.val1100;
    data['set_1200'] = this.set1200;
    data['val_1200'] = this.val1200;
    data['set_430'] = this.set430;
    data['val_430'] = this.val430;
    data['set_300'] = this.set300;
    data['val_300'] = this.val300;
    data['result_1100'] = this.result1100;
    data['result_1200'] = this.result1200;
    data['result_300'] = this.result300;
    data['result_430'] = this.result430;
    data['internet_930'] = this.internet930;
    data['modern_930'] = this.modern930;
    data['internet_200'] = this.internet200;
    data['modern_200'] = this.modern200;
    data['date'] = this.date;
    data['time_1100'] = this.time1100;
    data['time_1200'] = this.time1200;
    data['time_300'] = this.time300;
    data['time_430'] = this.time430;
    data['live'] = this.live;
    return data;
  }
}
