import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/models/post_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class AnswerCard extends StatelessWidget {
  final bool isVerify;
  const AnswerCard({Key key, this.isVerify = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(20),
          vertical: getScreenHeight(14),
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeading(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et",
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 12,
                color: Color(0xFF929292),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            _buildBottom(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Row _buildHeading() {
    return Row(
      children: [
        SvgPicture.asset(
          Asset.PROFILE_CIRCLE_ICON,
          width: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Kasama Thongsawang : 1 m ",
          style: TextStyle(
            fontFamily: "SF Pro",
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        SvgPicture.asset(Asset.VERTICAL_POINT_ICON),
      ],
    );
  }

  Row _buildBottom() {
    return Row(
      children: [
        _buildLike(),
        _buildComment(),
        _buildbook(),
      ],
    );
  }

  _buildbook() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Asset.BOOK_ICON,
            color: Color(0xFF8A8A8A),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "correct",
            style: TextStyle(
              fontFamily: "SF Pro",
              fontSize: 12,
              color: Color(0xFF8A8A8A),
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
}
