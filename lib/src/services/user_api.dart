import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/models/user_api_model.dart';
import 'package:home_mobile_application/src/services/auth.dart';

class UserController extends GetxController {
  Rx<UserApiModel> user = Rx<UserApiModel>();
  String userdoc;
  final authController = Get.find<Auth>();

  Future<void> deleteReactionPost(String postid, isLike) async {
    await FirebaseFirestore.instance.collection("user").doc(userdoc).update({
      "reaction": FieldValue.arrayRemove([
        {
          "postid": postid,
          "isLike": isLike,
        }
      ])
    });
  }

  Future<void> reactionPost(String postid, bool isLike) async {
    print("in reactionPost function");
    print("postid : $postid");
    print("isLike : $isLike");
    await FirebaseFirestore.instance.collection("user").doc(userdoc).update({
      "reaction": FieldValue.arrayUnion([
        {
          "postid": postid,
          "isLike": isLike,
        }
      ])
    });
  }

  Future<void> deleteBookmark(String postid) async {
    await FirebaseFirestore.instance.collection("user").doc(userdoc).update({
      "bookmark": FieldValue.arrayRemove([postid])
    });
  }

  Future<void> addBookmark(String postid) async {
    await FirebaseFirestore.instance.collection("user").doc(userdoc).update({
      "bookmark": FieldValue.arrayUnion([postid])
    });
  }

  bool isBookmark(String postid) {
    print("in function isbookmark");
    if (user.value.bookmark.length == 0) return false;
    return user.value.bookmark
                .where((element) => element == postid)
                .toList()
                .length ==
            0
        ? false
        : true;
  }

  bool checkPostLike(String postid) {
    bool isLike;
    user.value.reaction.forEach((element) {
      if (element.postid == postid) isLike = element.isLike;
    });

    return isLike;
  }

  Future<void> getUser() async {
    user.bindStream(FirebaseFirestore.instance
        .collection("user")
        .where("userid", isEqualTo: authController.user.value.uid)
        .snapshots()
        .map((e) {
      print(e.docs[0].data());
      userdoc = e.docs[0].id;
      return UserApiModel.fromJson(e.docs[0].data());
    }));
  }

  @override
  void onInit() async {
    await getUser();
    super.onInit();
  }
}
