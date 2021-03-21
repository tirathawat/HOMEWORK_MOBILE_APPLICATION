import 'package:flutter/material.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/constants/asset.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
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
                _buildStat(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Room",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    _buildTag("Mathematics"),
                    _buildTag("Physics"),
                    _buildTag("Biology"),
                    _buildTag("English"),
                  ],
                ),
                SizedBox(
                  height: 73,
                ),
                _buildAnswer(true),
                _buildAnswer(false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAnswer(bool ischeck) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 25,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 15,
            child: Container(
              margin: EdgeInsets.only(
                top: 5,
                right: 18,
              ),
              padding: EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: ischeck ? Color(0xFF1ABD00) : Color(0xFFC6C6C6),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                Asset.CHECK_CIRCLE_ICON,
              ),
            ),
          ),
          Expanded(
            flex: 85,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Mathemetics G9",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "20 mins",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF585858),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Python typing of class instance attributes as copies of input args",
                  style: TextStyle(
                    fontSize: 18,
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
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF0073BB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Column _buildStat() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(Asset.HELP_CIRCLE_ICON),
            SizedBox(
              width: 10,
            ),
            Text(
              "100",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              " Question",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF828282),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Image.asset(
              Asset.COMMENT_ICON,
              color: Color(0xFF828282),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "100",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              " Answers",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF828282),
              ),
            ),
          ],
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
            right: getScreenWidth(20),
          ),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gan Dragonfly",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "bio",
                style: TextStyle(
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
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
        actions: [
          Row(
            children: [
              Icon(Icons.bookmark_outline),
              SizedBox(
                width: 8,
              ),
              Text(
                "Saved",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Image.asset(Asset.SETTINGS_ICON),
          ),
        ],
      );
}
