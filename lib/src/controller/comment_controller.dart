import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/models/post_api_model.dart';

class CommentController extends GetxController {
  RxBool isComment = false.obs;
  TextEditingController comment = TextEditingController();

  void clear() {
    isComment.value = false;
    comment.clear();
  }

  Future<void> createComment(
      String postid, String detail, String commentator) async {
    print("postid : $postid");
    print("detail : $detail");
    print("commentator : $commentator");

    await FirebaseFirestore.instance.collection("posts").doc(postid).update({
      "comment": FieldValue.arrayUnion([
        {
          "is_verify": false,
          "like": 0,
          "commentator": commentator,
          "comment": [],
          "detail": detail,
          "created_at": DateTime.now().toIso8601String(),
        }
      ])
    }).onError((error, stackTrace) => print(error.message));
  }
}
