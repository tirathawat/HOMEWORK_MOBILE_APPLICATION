// To parse this JSON data, do
//
//     final userApiModel = userApiModelFromJson(jsonString);

import 'dart:convert';

UserApiModel userApiModelFromJson(String str) =>
    UserApiModel.fromJson(json.decode(str));

class UserApiModel {
  UserApiModel({
    this.userid,
    this.photoUrl,
    this.reaction,
    this.email,
    this.bookmark,
    this.username,
    this.comment,
  });

  String userid;
  String photoUrl;
  List<Reaction> reaction;
  String email;
  List<String> bookmark;
  String username;
  List<String> comment;

  factory UserApiModel.fromJson(Map<String, dynamic> json) => UserApiModel(
        userid: json["userid"] == null ? null : json["userid"],
        photoUrl: json["photo_url"] == null ? null : json["photo_url"],
        reaction: json["reaction"] == null
            ? null
            : List<Reaction>.from(
                json["reaction"].map((x) => Reaction.fromJson(x))),
        email: json["email"] == null ? null : json["email"],
        bookmark: json["bookmark"] == null
            ? null
            : List<String>.from(json["bookmark"].map((x) => x)),
        username: json["username"] == null ? null : json["username"],
        comment: json["comment"] == null
            ? null
            : List<String>.from(json["comment"].map((x) => x)),
      );
}

class Reaction {
  Reaction({
    this.isLike,
    this.postid,
  });

  bool isLike;
  String postid;

  factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
        isLike: json["isLike"] == null ? null : json["isLike"],
        postid: json["postid"] == null ? null : json["postid"],
      );
}
