import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/models/post_api_model.dart';
import 'package:home_mobile_application/src/pages/post_detail/post_detail.page.dart';
import 'package:timeago/timeago.dart' as timeago;

class QuestionCard extends StatelessWidget {
  final bool hasImage, hasText;
  final PostApiModel post;
  const QuestionCard({
    Key key,
    this.hasImage = false,
    this.hasText = true,
    @required this.post,
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
          GestureDetector(
            onTap: _onClickCard,
            child: Column(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Asset.BOOKMARK_ICON),
          SizedBox(
            width: 10,
          ),
          Text(
            "mark",
            style: TextStyle(
              fontFamily: "SF Pro",
              fontSize: 12,
              color: Color(0xFFFF9900),
            ),
          ),
        ],
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
          SvgPicture.asset(Asset.LIKE_ICON),
          SizedBox(
            width: 10,
          ),
          Text(
            post.like.toString(),
            style: TextStyle(
              fontFamily: "SF Pro",
              fontSize: 12,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Transform.rotate(
            angle: pi,
            child: SvgPicture.asset(
              Asset.LIKE_ICON,
              color: Color(0xFFD50707),
              //color: Color(0xFF929292),
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
        SvgPicture.asset(Asset.BOOK_ICON),
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
              "${post.roomName} : ${post.levelName} : ${timeago.format(post.createdAt, locale: 'th en')}",
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 15,
                color: Color(0xFF929292),
              ),
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
