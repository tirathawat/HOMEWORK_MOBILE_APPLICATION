import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/constants/type.dart';
import 'package:home_mobile_application/src/pages/search/search_result_page.dart';

class SearchPage extends StatelessWidget {
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
    borderSide: BorderSide(
      color: Color(0xFF282846).withOpacity(.5),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 17,
          ),
          _buildSearchBox(),
          SizedBox(
            height: 37,
          ),
          _buildTitle("Recent Post Viewed"),
          SizedBox(
            height: 28,
          ),
          Column(
            children: List.generate(
              3,
              (index) => _buildRecentItem(index == 0 ? true : false),
            ),
          ),
          SizedBox(
            height: 34,
          ),
          _buildTitle("Trending"),
          SizedBox(
            height: 28,
          ),
          Column(
            children: List.generate(
              5,
              (index) => _buildTradingItem(
                index == 0 || index == 4
                    ? trading_type.increase
                    : index == 3
                        ? trading_type.decrease
                        : trading_type.same,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 26,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "SF Pro",
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Color(0xFF282846),
        ),
      ),
    );
  }

  Container _buildRecentItem(bool isCorrect) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.1,
            color: Color(0xFF707070),
          ),
          bottom: BorderSide(
            width: 0.1,
            color: Color(0xFF707070),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15,
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
            child: Text(
              "Lorem ipsum.",
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTradingItem(trading_type type) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.1,
            color: Color(0xFF707070),
          ),
          bottom: BorderSide(
            width: 0.1,
            color: Color(0xFF707070),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 28,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SvgPicture.asset(
              type == trading_type.increase
                  ? Asset.INCREASE_ICON
                  : type == trading_type.decrease
                      ? Asset.DECREASE_ICON
                      : Asset.SAME_ICON,
            ),
          ),
          SizedBox(
            width: 35,
          ),
          Expanded(
            flex: 20,
            child: Text(
              "Lorem ipsum.",
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildSearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: 40,
      child: TextField(
        onSubmitted: (value) {
          Get.to(SearchResultPage(searchStr: value));
        },
        style: TextStyle(
          fontFamily: "SF Pro",
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: Color(0xFF343447),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyle(
            fontFamily: "SF Pro",
            fontSize: 15,
            color: Color(0xFF282846).withOpacity(.5),
          ),
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xFF282846).withOpacity(.5),
          ),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
        ),
      ),
    );
  }
}
