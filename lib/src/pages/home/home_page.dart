import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/widgets/custom_dropdown.dart';
import 'package:home_mobile_application/src/widgets/question_card.dart';

class HomePage extends StatelessWidget {
  final RxInt _navIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFDFF),
      appBar: _buildAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildDropDown(),
              _buildFeed(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildNavbar(),
    );
  }

  Obx _buildNavbar() {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _navIndex.value,
        onTap: (value) {
          _navIndex.value = value;
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(Asset.HOME_ICON),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Asset.SEARCH_ICON),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Asset.PLUS_ICON),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Asset.COMMENT_ICON,
            ),
            label: "",
          ),
        ],
      ),
    );
  }

  _buildDropDown() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getScreenWidth(13),
        horizontal: getScreenWidth(25),
      ),
      child: Row(
        children: [
          CustomDropdown(
            initialValue: "All Subject",
            items: [
              'All Subject',
              'Mathematics',
              'Physics',
              'Biology',
              'Chemistry'
            ],
          ),
          SizedBox(
            width: getScreenWidth(25),
          ),
          CustomDropdown(
            initialValue: "All Grade",
            items: [
              'All Grade',
              'Grade 7',
              'Grade 8',
              'Grade 9',
              'High school'
            ],
          ),
        ],
      ),
    );
  }

  _buildAppbar() {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(color: Color(0xFFF8F8F8)),
    );
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: getScreenHeight(110),
      leadingWidth: getScreenWidth(105),
      leading: Container(
        margin: EdgeInsets.only(
          left: getScreenWidth(23),
          top: getScreenHeight(20),
          bottom: getScreenHeight(30),
        ),
        height: getScreenHeight(60),
        width: getScreenWidth(60),
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
      title: Container(
        height: getScreenHeight(40),
        width: double.infinity,
        margin: EdgeInsets.only(
          bottom: getScreenHeight(10),
          right: getScreenWidth(15),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 20,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF8F8F8),
            suffixIcon: Image.asset(
              Asset.SEARCH_ICON,
              width: getScreenWidth(25.26),
              color: Colors.black,
            ),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder,
          ),
        ),
      ),
    );
  }

  _buildFeed() => Column(
        children: List.generate(
            10,
            (index) => index == 0 || index == 5
                ? QuestionCard(
                    isCheck: true,
                  )
                : QuestionCard()),
      );
}
