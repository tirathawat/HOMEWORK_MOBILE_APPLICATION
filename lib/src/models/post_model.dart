// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel({
    this.postId,
    this.header,
    this.detail,
    this.roomId,
    this.levelId,
    this.posterId,
    this.createdAt,
    this.userName,
    this.roomname,
    this.levelname,
    this.like,
    this.dislike,
    this.isreact,
    this.comment,
    this.isVerify,
  });

  int postId;
  String header;
  String detail;
  int roomId;
  int levelId;
  String posterId;
  DateTime createdAt;
  String userName;
  String roomname;
  String levelname;
  int like;
  int dislike;
  bool isreact;
  List<Comment> comment;
  bool isVerify;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        postId: json["post_id"],
        header: json["header"],
        detail: json["detail"],
        roomId: json["room_id"],
        levelId: json["level_id"],
        posterId: json["poster_id"],
        createdAt: DateTime.parse(json["created_at"]),
        userName: json["user_name"],
        roomname: json["roomname"],
        levelname: json["levelname"],
        like: json["like"],
        dislike: json["dislike"],
        isreact: json["isreact"],
        comment:
            List<Comment>.from(json["comment"].map((x) => Comment.fromJson(x))),
        isVerify: json["is_verify"],
      );

  Map<String, dynamic> toJson() => {
        "post_id": postId,
        "header": header,
        "detail": detail,
        "room_id": roomId,
        "level_id": levelId,
        "poster_id": posterId,
        "created_at": createdAt.toIso8601String(),
        "user_name": userName,
        "roomname": roomname,
        "levelname": levelname,
        "like": like,
        "dislike": dislike,
        "isreact": isreact,
        "comment": List<dynamic>.from(comment.map((x) => x.toJson())),
        "is_verify": isVerify,
      };
}

class Comment {
  Comment({
    this.commentId,
    this.detail,
    this.parentCommentId,
    this.parentPostId,
    this.isVerify,
    this.commentor,
    this.createdAt,
  });

  int commentId;
  String detail;
  dynamic parentCommentId;
  int parentPostId;
  int isVerify;
  String commentor;
  DateTime createdAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        commentId: json["comment_id"],
        detail: json["detail"],
        parentCommentId: json["parent_comment_id"],
        parentPostId: json["parent_post_id"],
        isVerify: json["is_verify"],
        commentor: json["commentor"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "comment_id": commentId,
        "detail": detail,
        "parent_comment_id": parentCommentId,
        "parent_post_id": parentPostId,
        "is_verify": isVerify,
        "commentor": commentor,
        "created_at": createdAt.toIso8601String(),
      };
}
