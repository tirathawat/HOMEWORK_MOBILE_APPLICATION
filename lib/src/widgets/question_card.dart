import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/models/post_api_model.dart';
import 'package:home_mobile_application/src/pages/post_detail/post_detail.page.dart';
import 'package:home_mobile_application/src/services/post_api.dart';
import 'package:home_mobile_application/src/services/user_api.dart';
import 'package:timeago/timeago.dart' as timeago;

class QuestionCard extends StatelessWidget {
  final userController = Get.find<UserController>();
  final postController = Get.find<PostController>();
  final bool hasImage, hasText;
  final PostApiModel post;
  final bool isRealtime;
  final RxInt add = 0.obs;
  QuestionCard({
    Key key,
    this.hasImage = false,
    this.hasText = true,
    @required this.post,
    this.isRealtime = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _buildHeading(),
          InkWell(
            onTap: _onClickCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                _buildTitle(),
                SizedBox(
                  height: 15,
                ),
                _buildDetail(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          _buildBottom(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  void _onClickCard() {
    Get.to(PostDetailPage(
      post: post,
    ));
  }

  Row _buildBottom() {
    return Row(
      children: [
        _buildLike(),
        _buildComment(),
        _buildbookmark(),
      ],
    );
  }

  _buildbookmark() {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          if (userController.isBookmark(post.postId))
            userController.deleteBookmark(post.postId);
          else
            userController.addBookmark(post.postId);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (userController.user.value == null)
                return SvgPicture.asset(Asset.BOOKMARK_ICON);
              else
                return SvgPicture.asset(
                  Asset.BOOKMARK_ICON,
                  color: userController.isBookmark(post.postId)
                      ? Color(0xFFFF9900)
                      : Color(0xFF929292),
                );
            }),
            SizedBox(
              width: 10,
            ),
            Obx(
              () {
                if (userController.user.value == null)
                  return Text(
                    "mark",
                    style: TextStyle(
                      fontFamily: "SF Pro",
                      fontSize: 12,
                      color: Color(0xFF929292),
                    ),
                  );
                else
                  return Text(
                    "mark",
                    style: TextStyle(
                      fontFamily: "SF Pro",
                      fontSize: 12,
                      color: userController.isBookmark(post.postId)
                          ? Color(0xFFFF9900)
                          : Color(0xFF929292),
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildComment() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Asset.COMMENT_ICON),
          SizedBox(
            width: 10,
          ),
          Text(
            post.comment.length.toString(),
            style: TextStyle(
              fontFamily: "SF Pro",
              fontSize: 12,
              color: Color(0xFF929292),
            ),
          ),
        ],
      ),
    );
  }

  _buildLike() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              var check = userController.checkPostLike(post.postId);

              if (check == null || check == false) {
                userController.reactionPost(post.postId, true);

                if (check == false) {
                  userController.deleteReactionPost(post.postId, false);
                  postController.changeNumberOfLike(post.postId, 2);
                  add.value = 0;
                } else
                  postController.changeNumberOfLike(post.postId, 1);
                add.value = 1;
              } else {
                userController.deleteReactionPost(post.postId, true);
                add.value = 0;
                postController.changeNumberOfLike(post.postId, -1);
              }
            },
            child: Obx(
              () {
                bool check = userController.checkPostLike(post.postId);
                return SvgPicture.asset(
                  Asset.LIKE_ICON,
                  color: userController.user.value.reaction.length == 0 ||
                          check == null
                      ? Color(0xFF929292)
                      : check
                          ? Color(0xFF00800D)
                          : Color(0xFF929292),
                );
              },
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Obx(
            () => Text(
              (post.like + add.value).toString(),
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () async {
              var check = userController.checkPostLike(post.postId);

              if (check == null || check == true) {
                userController.reactionPost(post.postId, false);

                if (check == true) {
                  userController.deleteReactionPost(post.postId, true);
                  postController.changeNumberOfLike(post.postId, -2);
                  add.value = 0;
                } else {
                  postController.changeNumberOfLike(post.postId, -1);
                  add.value = -1;
                }
              } else {
                userController.deleteReactionPost(post.postId, false);
                postController.changeNumberOfLike(post.postId, 1);
                add.value = 0;
              }
            },
            child: Transform.rotate(
              angle: pi,
              child: Obx(
                () {
                  if (userController.user.value == null) {
                    return SvgPicture.asset(
                      Asset.LIKE_ICON,
                      color: Color(0xFF929292),
                    );
                  } else {
                    bool check = userController.checkPostLike(post.postId);
                    return SvgPicture.asset(
                      Asset.LIKE_ICON,
                      color: userController.user.value.reaction.length == 0 ||
                              check == null
                          ? Color(0xFF929292)
                          : check
                              ? Color(0xFF929292)
                              : Color(0xFFD50707),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasText)
          Text(
            post.detail,
            style: TextStyle(
              fontFamily: "SF Pro",
              fontSize: 12,
              color: Color(0xFF929292),
            ),
          ),
        if (hasImage)
          Center(child: Image.asset("assets/icons/promotion_image_mock.png")),
      ],
    );
  }

  Row _buildTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          Asset.BOOK_ICON,
          color: post.isVerify ? Color(0xFF00800D) : Color(0xFF929292),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            post.header,
            style: TextStyle(
              fontFamily: "SF Pro",
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xFF282846),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildHeading() {
    return Row(
      children: [
        SvgPicture.asset(
          Asset.PROFILE_CIRCLE_ICON,
          width: 40,
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${post.roomName} : ${post.levelName} : ${timeago.format(post.createdAt, locale: 'en_short')}",
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 15,
                color: Color(0xFF929292),
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              post.posterName,
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF343447),
              ),
            ),
          ],
        ),
        Spacer(),
        SvgPicture.asset(Asset.VERTICAL_POINT_ICON),
      ],
    );
  }
}
