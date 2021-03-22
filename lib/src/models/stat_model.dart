import 'dart:convert';

StatModel statModelFromJson(String str) => StatModel.fromJson(json.decode(str));

String statModelToJson(StatModel data) => json.encode(data.toJson());

class StatModel {
  StatModel({
    this.status,
    this.result,
  });

  String status;
  Result result;

  factory StatModel.fromJson(Map<String, dynamic> json) => StatModel(
        status: json["status"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.post,
    this.comment,
  });

  String post;
  String comment;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        post: json["post"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "post": post,
        "comment": comment,
      };
}
