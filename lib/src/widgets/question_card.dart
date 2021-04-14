import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/pages/post_detail/post_detail.page.dart';

class QuestionCard extends StatelessWidget {
  final bool hasImage, hasText;

  const QuestionCard({Key key, this.hasImage = false, this.hasText = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PostDetailPage());
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _buildHeading(),
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
            _buildBottom(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
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
            "150",
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
            "150",
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
            child: SvgPicture.asset(Asset.LIKE_ICON),
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
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et",
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
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam ng",
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
              "Math : G.9 : 2 m ago",
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 15,
                color: Color(0xFF929292),
              ),
            ),
            Text(
              "Kasama Thongsawang",
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
