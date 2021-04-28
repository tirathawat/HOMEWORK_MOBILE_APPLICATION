import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/pages/loading/promote_app_page.dart';
import 'package:home_mobile_application/src/services/auth.dart';
import 'package:home_mobile_application/src/services/post_api.dart';
import 'package:home_mobile_application/src/services/user_api.dart';

class ProfilePage extends StatelessWidget {
  final userController = Get.find<UserController>();
  final postController = Get.find<PostController>();
  // List<String> rooms = [];
  final List<String> rooms = [
    "Mathasdasdasd",
    "English",
    "Physic",
  ];
  @override
  Widget build(BuildContext context) {
    // rooms = postController.getUserPost(userController.user.value.userid);
    print(postController.getUserPost(userController.user.value.userid));
    print(postController.getUserPost('asdasd'));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(26),
                  vertical: getScreenHeight(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeading(),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Room",
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      children: List.generate(
                        rooms.length,
                        (index) => _buildTag(
                          rooms[index],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 43,
                    ),
                    Text(
                      "Post",
                      style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              _buildPostItem(true),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildPostItem(bool isCorrect) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0x929292).withOpacity(.35),
          ),
          bottom: BorderSide(
            color: Color(0x929292).withOpacity(.35),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 28,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Asset.BOOK_ICON,
            color: isCorrect ? Color(0xFF00800D) : Color(0xFF8A8A8A),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              children: [
                Text(
                  "Lorem ipsum.",
                  style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Math : G9 : 2m ago",
                  style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 11,
                    color: Color(0xFF8A8A8A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTag(String text) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15,
        ),
        border: Border.all(
          color: Color(0xFFD75A20),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "SF Pro",
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Color(0xFFD75A20),
        ),
      ),
    );
  }

  Row _buildHeading() {
    String subBio = (userController.user.value.postNo != null ? userController.user.value.postNo.toString() : '0') + " Posts " + (userController.user.value.commentNo != null ? userController.user.value.commentNo.toString() : '0') + " Comments";
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          Asset.PROFILE_CIRCLE_ICON,
          width: 80,
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userController.user.value.bio,
                  style: TextStyle(
                      fontFamily: "SF Pro",
                      fontSize: 13,
                      color: Color(0xFF444444)),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  subBio,
                  style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 11,
                    color: Color(0xFF929292),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          userController.user.value.username,
          style: TextStyle(
            fontFamily: "SF Pro",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF282846),
          ),
        ),
        actions: [
          SvgPicture.asset(
            Asset.BOOKMARK_ICON,
            color: Color(0xFF282846),
          ),
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              Auth().signout();
              Get.off(PromoteAppPage());
            },
            child: SvgPicture.asset(
              Asset.SETTING_ICON,
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      );
}
