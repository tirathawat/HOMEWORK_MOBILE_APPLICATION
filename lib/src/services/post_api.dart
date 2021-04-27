import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/models/post_api_model.dart';

class PostController extends GetxController {
  Rx<List<PostApiModel>> post = Rx<List<PostApiModel>>();

  Future<void> changeNumberOfLike(String postid, int number) async {
    await FirebaseFirestore.instance.collection("posts").doc(postid).update({
      "like": FieldValue.increment(number),
    });
  }

  Future<void> createPost(
      {String room, String level, String tital, String detail}) async {}

  Future<void> getPost() async {
    post.bindStream(
        FirebaseFirestore.instance.collection("posts").snapshots().map((e) {
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
