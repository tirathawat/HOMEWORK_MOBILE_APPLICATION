import 'package:flutter/material.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/models/post_model.dart';

class AnswerCard extends StatelessWidget {
  final Comment comment;

  const AnswerCard({Key key, @required this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getScreenWidth(20),
        vertical: getScreenHeight(14),
      ),
      color: Colors.white,
      child: Column(
        children: [
          _buildHeading(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              if (true)
                Row(
                  children: [
                    Image.asset(
                      Asset.CHECK_CIRCLE_ICON,
                      color: Color(0xFF1ABD00),
                      height: getScreenHeight(30),
                      width: getScreenWidth(30),
                    ),
                    SizedBox(
                      width: getScreenWidth(10),
                    ),
                    Text(
                      "Correct",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.more_vert),
                  SizedBox(
                    width: getScreenWidth(30),
                  ),
                  Image.asset(
                    Asset.LIKE_ICON,
                    color: Color(0xFF5F5F5F),
                  ),
                  SizedBox(
                    width: getScreenWidth(10),
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5F5F5F),
                    ),
                  ),
                  SizedBox(
                    width: getScreenWidth(30),
                  ),
                  Image.asset(
                    Asset.DISLIKE_ICON,
                    color: Color(0xFF5F5F5F),
                  ),
                  SizedBox(
                    width: getScreenWidth(10),
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5F5F5F),
                    ),
                  ),
                  SizedBox(
                    width: getScreenWidth(15),
                  ),
                  Image.asset(
                    Asset.COMMENT_ICON,
                    color: Color(0xFF5F5F5F),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildHeading() {
    return Row(
      children: [
        Container(
          width: getScreenWidth(24),
          height: getScreenHeight(24),
          decoration: BoxDecoration(
            color: Colors.pink,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Jet Dragonfly",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "3 m",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Color(0xFF828282),
          ),
        ),
      ],
    );
  }
}
