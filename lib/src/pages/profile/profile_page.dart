import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Room",
                  style: TextStyle(
                    
                    fontSize: 24,
                  
                  ),
                ),
                SizedBox(
                  height: 20,
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

  Row _buildHeading() {
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
                  "mai yak sod lew kub",
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
                  "100 Posts 100 Comments",
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
          "K. Thongsawang",
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
          SvgPicture.asset(
            Asset.SETTING_ICON,
          ),
          SizedBox(
            width: 30,
          ),
        ],
      );
}
