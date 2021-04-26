import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/models/post_api_model.dart';

class PostController extends GetxController {
  Rx<List<PostApiModel>> post = Rx<List<PostApiModel>>();

  Future<void> getPost() async {
    post.bindStream(
        FirebaseFirestore.instance.collection("posts").snapshots().map((e) {
      List<PostApiModel> posts = [];
      e.docs.forEach((element) {
        posts.add(PostApiModel.fromJson(element.data()));
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
