// To parse this JSON data, do
//
//     final postApiModel = postApiModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<PostApiModel> postApiModelFromJson(String str) => List<PostApiModel>.from(
    json.decode(str).map((x) => PostApiModel.fromJson(x)));

String postApiModelToJson(List<PostApiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostApiModel {
  PostApiModel({
    this.detail,
    this.levelName,
    this.like,
    this.roomName,
    this.createdAt,
    this.comment,
    this.header,
    this.room,
    this.level,
    this.posterId,
    this.posterName,
    this.isVerify,
    this.postId,
  });

  String detail;
  String levelName;
  int like;
  String roomName;
  DateTime createdAt;
  List<Comment> comment;
  String header;
  String room;
  String level;
  String posterId;
  String posterName;
  bool isVerify;
  String postId;

  factory PostApiModel.fromJson(Map<String, dynamic> json) => PostApiModel(
        detail: json["detail"] == null ? null : json["detail"],
        levelName: json["level_name"] == null ? null : json["level_name"],
        like: json["like"] == null ? null : json["like"],
        roomName: json["room_name"] == null ? null : json["room_name"],
        createdAt:
            json["created_at"] == null ? null : json["created_at"].toDate(),
        comment: json["comment"] == null
            ? null
            : List<Comment>.from(
                json["comment"].map((x) => Comment.fromJson(x))),
        header: json["header"] == null ? null : json["header"],
        room: json["room"] == null ? null : json["room"],
        level: json["level"] == null ? null : json["level"],
        posterId: json["poster_id"] == null ? null : json["poster_id"],
        posterName: json["poster_name"] == null ? null : json["poster_name"],
        isVerify: json["is_verify"] == null ? null : json["is_verify"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail == null ? null : detail,
        "level_name": levelName == null ? null : levelName,
        "like": like == null ? null : like,
        "room_name": roomName == null ? null : roomName,
        "created_at": FieldValue.serverTimestamp(),
        "comment": comment == null
            ? null
            : List<dynamic>.from(comment.map((x) => x.toJson())),
        "header": header == null ? null : header,
        "room": room == null ? null : room,
        "level": level == null ? null : level,
        "poster_id": posterId == null ? null : posterId,
        "poster_name": posterName == null ? null : posterName,
        "is_verify": isVerify == null ? null : isVerify,
      };
}

class Comment {
  Comment({
    this.isVerify,
    this.like,
    this.commentator,
    this.comment,
    this.detail,
    this.createdAt,
  });

  bool isVerify;
  int like;
  String commentator;
  List<Comment> comment;
  String detail;
  String createdAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        isVerify: json["is_verify"] == null ? null : json["is_verify"],
        like: json["like"] == null ? null : json["like"],
        commentator: json["commentator"] == null ? null : json["commentator"],
        comment: json["comment"] == null
            ? null
            : List<Comment>.from(
                json["comment"].map((x) => Comment.fromJson(x))),
        detail: json["detail"] == null ? null : json["detail"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "is_verify": isVerify == null ? false : isVerify,
        "like": like == null ? null : like,
        "commentator": commentator == null ? null : commentator,
        "comment": comment == null
            ? null
            : List<dynamic>.from(comment.map((x) => x.toJson())),
        "detail": detail == null ? null : detail,
        "created_at": FieldValue.serverTimestamp(),
      };
}
