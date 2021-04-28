import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/controller/comment_controller.dart';
import 'package:home_mobile_application/src/controller/navbar_controller.dart';
import 'package:home_mobile_application/src/models/post_api_model.dart';
import 'package:home_mobile_application/src/pages/home/home_page.dart';
import 'package:home_mobile_application/src/services/post_api.dart';
import 'package:home_mobile_application/src/services/user_api.dart';
import 'package:home_mobile_application/src/widgets/answer_card.dart';
import 'package:home_mobile_application/src/widgets/question_card.dart';

class PostDetailPage extends StatelessWidget {
  final _navbarController = Get.put(NavbarController());
  final userController = Get.find<UserController>();
  final commentController = Get.put(CommentController());

  final Rx<PostApiModel> post;
  PostDetailPage({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("postid: ${post.value.postId}");
    return Scaffold(
      backgroundColor: Color(0xFFFAFDFF),
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Obx(() => _buildBody()),
      ),
      bottomNavigationBar: Obx(() {
        return commentController.isComment.value
            ? SafeArea(
                child: CommentBox(
                  userImage: userController.user.value.photoUrl,
                  child: Padding(
                      padding: EdgeInsets.only(top: 103), child: _buildBody()),
                  labelText: 'Write a comment...',
                  withBorder: false,
                  errorText: 'Comment cannot be blank',
                  sendButtonMethod: () async {
                    print("send");
                    print(commentController.comment.text);
                    if (commentController.comment.text != '') {
                      commentController.createComment(
                          post.value.postId,
                          commentController.comment.text,
                          userController.user.value.username);
                      commentController.clear();
                      FirebaseFirestore.instance
                          .collection("posts")
                          .doc(post.value.postId)
                          .get()
                          .then((value) {
                        print("value: ${value.data()}");
                        post.value = PostApiModel.fromJson(value.data());
                      });
                    }
                  },
                  commentController: commentController.comment,
                  backgroundColor: Colors.white,
                  textColor: Color(0xFF282846),
                  sendWidget: Icon(Icons.send_sharp,
                      size: 30, color: Color(0xFF282846)),
                ),
              )
            : _buildNavbar();
      }),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: QuestionCard(
              isRealtime: false,
              post: post.value,
            ),
          ),
          Container(
            color: Color(0xFF707070).withOpacity(.25),
            height: 5,
            width: double.infinity,
          ),
          Column(
            children: List.generate(
              post.value.comment.length,
              (index) => Column(
                children: [
                  AnswerCard(
                    comment: post.value.comment[index],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                    ),
                    child: Column(
                      children: [
                        // Container(
                        //   color: Color(0xFF707070).withOpacity(.25),
                        //   height: 2,
                        //   width: double.infinity,
                        // ),
                        SizedBox(
                          width: 15,
                        ),
                        ...List.generate(
                            post.value.comment[index].comment.length, (i) {
                          return AnswerCard(
                              comment: post.value.comment[index].comment[i]);
                        }),
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xFF707070).withOpacity(.25),
                    height: 2,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Obx _buildNavbar() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _navbarController.currentIndex.value,
          onTap: (value) {
            _navbarController.currentIndex.value = value;
            Get.off(HomePage());
          },
          items: [
            BottomNavigationBarItem(
              icon: _navbarController.currentIndex.value == 0
                  ? SvgPicture.asset(Asset.HOME_CLICK_ICON)
                  : SvgPicture.asset(Asset.HOME_ICON),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _navbarController.currentIndex.value == 1
                  ? SvgPicture.asset(Asset.SEARCH_CLICK_ICON)
                  : SvgPicture.asset(Asset.SEARCH_ICON),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _navbarController.currentIndex.value == 2
                  ? SvgPicture.asset(Asset.PLUS_CLICK_ICON)
                  : SvgPicture.asset(Asset.PLUS_ICON),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _navbarController.currentIndex.value == 3
                  ? SvgPicture.asset(Asset.MESSAGE_CLICK_ICON)
                  : SvgPicture.asset(
                      Asset.MESSAGE_ICON,
                    ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: false,
        title: Text(
          "Post detail",
          style: TextStyle(
            fontFamily: "SF Pro",
            color: Color(0xFF282846),
          ),
        ),
      );
}
