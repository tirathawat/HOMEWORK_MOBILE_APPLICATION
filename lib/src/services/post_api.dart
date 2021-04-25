import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/models/post_model.dart';

class PostController extends GetxController {
  Rx<List<PostModel>> post = Rx<List<PostModel>>();

  Future<List<PostModel>> getPost() async {
    return FirebaseFirestore.instance.collection("posts").get().then((e) {
      List<PostModel> posts = [];
      e.docs.forEach((element) {
        posts.add(PostModel(
          postId: element.id,
          header: element["header"],
          detail: element["detail"],
          roomId: element["room"],
          levelId: element["level"],
          posterId: element["poster_id"],
          createdAt: element["created_at"].toDate(),
        ));
      });
      return posts;
    });
  }

  @override
  void onInit() async {
    await getPost();
    super.onInit();
  }
}
