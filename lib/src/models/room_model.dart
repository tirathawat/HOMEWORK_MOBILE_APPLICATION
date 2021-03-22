// To parse this JSON data, do
//
//     final roomModel = roomModelFromJson(jsonString);

import 'dart:convert';

RoomModel roomModelFromJson(String str) => RoomModel.fromJson(json.decode(str));

String roomModelToJson(RoomModel data) => json.encode(data.toJson());

class RoomModel {
  RoomModel({
    this.status,
    this.result,
  });

  String status;
  List<Result> result;

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.roomId,
    this.name,
  });

  int roomId;
  String name;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        roomId: json["room_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "name": name,
      };
}
