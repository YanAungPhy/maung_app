class CheckUpdateModel {
  final int id;
  final String name;
  final String body;
  final String playstoreUrl;
  final String directUrl;
  final int status;

  CheckUpdateModel({
    required this.id,
    required this.name,
    required this.body,
    required this.playstoreUrl,
    required this.directUrl,
    required this.status,
  });

  // Factory method to create an CheckUpdateModel object from JSON
  factory CheckUpdateModel.fromJson(Map<String, dynamic> json) {
    return CheckUpdateModel(
      id: json['id'],
      name: json['name'],
      body: json['body'],
      playstoreUrl: json['playstore_url'],
      directUrl: json['direct_url'],
      status: json['status'],
    );
  }

  // Method to convert CheckUpdateModel object to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['body'] = body;
    data['playstore_url'] = playstoreUrl;
    data['direct_url'] = directUrl;
    data['status'] = status;
    return data;
  }
}
