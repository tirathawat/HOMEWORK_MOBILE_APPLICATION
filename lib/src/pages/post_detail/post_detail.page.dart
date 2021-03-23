import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/controller/navbar_controller.dart';
import 'package:home_mobile_application/src/models/post_model.dart';
import 'package:home_mobile_application/src/widgets/answer_card.dart';
import 'package:home_mobile_application/src/widgets/question_card.dart';

class PostDetailPage extends StatelessWidget {
  final _navbarController = Get.put(NavbarController());
  final PostModel post;

  PostDetailPage({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFDFF),
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              QuestionCard(
                post: post,
              ),
              Column(
                children: List.generate(
                    post.comment.length,
                    (index) => Column(
                          children: [
                            AnswerCard(comment: post.comment[index]),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getScreenWidth(60),
                              ),
                              child: Column(
                                children: List.generate(
                                    post.comment[index].subcomment.length,
                                    (index) {
                                  if (post.comment[index].subcomment.length ==
                                      0)
                                    return SizedBox();
                                  else
                                    return AnswerCard(
                                        comment: post
                                            .comment[index].subcomment[index]);
                                }),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildNavbar(),
    );
  }

  Obx _buildNavbar() {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _navbarController.currentIndex.value,
        onTap: (value) {
          Get.back();
          _navbarController.currentIndex.value = value;
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(Asset.HOME_ICON),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Asset.SEARCH_ICON),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Asset.PLUS_ICON),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Asset.COMMENT_ICON,
            ),
            label: "",
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Icon(Icons.bookmark_outline),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Icon(Icons.more_vert),
          ),
        ],
      );
}
