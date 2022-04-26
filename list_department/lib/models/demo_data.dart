import 'dart:convert';

List<DemoData> demoDataFromJson(String str) =>
    List<DemoData>.from(json.decode(str).map((x) => DemoData.fromJson(x)));

String demoDataToJson(List<DemoData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DemoData {
  DemoData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory DemoData.fromJson(Map<String, dynamic> json) => DemoData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
