import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/pages/post_detail/post_detail.page.dart';

class QuestionCard extends StatelessWidget {
  final bool isCheck;

  const QuestionCard({Key key, this.isCheck = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PostDetailPage());
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(
          bottom: 17,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(20),
          vertical: getScreenHeight(20),
        ),
        child: Column(
          children: [
            _buildHeading(),
            _buildContent(),
            _buildBottom(),
          ],
        ),
      ),
    );
  }

  Row _buildBottom() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Asset.LIKE_ICON),
                SizedBox(
                  width: getScreenWidth(10),
                ),
                Text(
                  '10',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF717171),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Asset.DISLIKE_ICON),
              SizedBox(
                width: getScreenWidth(10),
              ),
              Text(
                '10',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF717171),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Asset.COMMENT_ICON,
                color: Color(0xFF717171),
              ),
              SizedBox(
                width: getScreenWidth(10),
              ),
              Text(
                '10',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF717171),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _buildContent() {
    return Column(
      children: [
        Text(
          "Python typing of class instance attributes as copies of input args",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: getScreenHeight(10),
        ),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy...",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF797979),
          ),
        ),
        SizedBox(
          height: getScreenHeight(14),
        ),
      ],
    );
  }

  Row _buildHeading() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            right: getScreenWidth(23),
            bottom: getScreenHeight(13),
          ),
          height: getScreenHeight(50),
          width: getScreenWidth(50),
          decoration: BoxDecoration(
            color: isCheck ? Color(0xFF1ABD00) : Color(0xFFC6C6C6),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            Asset.CHECK_CIRCLE_ICON,
            height: getScreenHeight(25),
            width: getScreenWidth(25),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mathemetics G9",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Gan Dragonfly • 20 mins",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF585858),
              ),
            ),
          ],
        ),
        Spacer(),
        Icon(Icons.more_vert),
      ],
    );
  }
}
