import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_mobile_application/src/constants/asset.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          _buildCard(),
          Container(
            height: 0.2,
            width: double.infinity,
            color: Color(0xFF8A8A8A),
          ),
        ],
      ),
    );
  }

  _buildCard() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 14,
          ),
          Row(
            children: [
              SvgPicture.asset(
                Asset.PROFILE_CIRCLE_ICON,
                width: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Kasama Thongsawang replied : 1 m",
                style: TextStyle(
                  fontFamily: "SF Pro",
                  fontSize: 13,
                  color: Color(0xFF282846),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam ng ",
            style: TextStyle(
              fontFamily: "SF Pro",
              fontSize: 17,
              color: Color(0xFF282846),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(Asset.SUB_ARROW_ICON),
              SizedBox(
                width: 15,
              ),
              Flexible(
                child: Text(
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam ",
                  style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 12,
                    color: Color(0xFF929292),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
