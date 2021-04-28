import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/models/post_api_model.dart';
import 'package:home_mobile_application/src/services/user_api.dart';

class PostController extends GetxController {
  Rx<List<PostApiModel>> post = Rx<List<PostApiModel>>();
  final userController = Get.find<UserController>();

  Future<void> changeNumberOfLike(String postid, int number) async {
    await FirebaseFirestore.instance.collection("posts").doc(postid).update({
      "like": FieldValue.increment(number),
    });
  }

  Future<void> createPost({
    @required String room,
    @required String level,
    @required String title,
    @required String detail,
  }) async {
    await FirebaseFirestore.instance.collection("posts").add(PostApiModel(
          detail: detail,
          levelName: level,
          like: 0,
          roomName: room,
          comment: [],
          header: title,
          isVerify: false,
          postId: FieldPath.documentId.toString(),
          posterName: userController.user.value.username,
          posterId: userController.userdoc,
        ).toJson());
  }

  Future<void> getPost() async {
    post.bindStream(FirebaseFirestore.instance
        .collection("posts")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((e) {
      List<PostApiModel> posts = [];
      e.docs.forEach((element) {
        var post = PostApiModel.fromJson(element.data());
        post.postId = element.id;
        posts.add(post);
      });
      return posts;
    }));
  }

  @override
  void onInit() async {
    await getPost();
    super.onInit();
  }
}
