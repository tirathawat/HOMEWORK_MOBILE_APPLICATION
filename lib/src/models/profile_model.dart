import 'dart:convert';

NameModel nameModelFromJson(String str) => NameModel.fromJson(json.decode(str));

String nameModelToJson(NameModel data) => json.encode(data.toJson());

class NameModel {
  NameModel({
    this.status,
    this.result,
  });

  String status;
  String result;

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        status: json["status"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
      };
}
