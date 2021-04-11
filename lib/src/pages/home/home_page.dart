import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/constants/items_dropdown.dart';
import 'package:home_mobile_application/src/controller/navbar_controller.dart';
import 'package:home_mobile_application/src/pages/create_post/create_post_page.dart';
import 'package:home_mobile_application/src/pages/feed/feed_page.dart';
import 'package:home_mobile_application/src/pages/profile/profile_page.dart';
import 'package:home_mobile_application/src/pages/search/search_page.dart';

class HomePage extends StatefulWidget {
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)),
    borderSide: BorderSide(color: Color(0xFFF8F8F8)),
  );
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _navbarController = Get.put(NavbarController());
  final int _gradeDropdownIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFDFF),
      appBar: _buildAppbar(),
      body: SafeArea(
        child: _buildContent(),
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
        currentIndex: _navbarController.currentIndex.value,
        onTap: (value) {
          setState(() {
            _navbarController.currentIndex.value = value;
          });
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

  _buildAppbar() {
    if (_navbarController.currentIndex.value == 0)
      return _buildFeedAppbar();
    else if (_navbarController.currentIndex.value == 1)
      return _buildSearchAppBar();
    else if (_navbarController.currentIndex.value == 2)
      return _buildCreatePostAppbar();
    else
      return _buildNotificationAppbar();
  }

  _buildContent() {
    if (_navbarController.currentIndex.value == 0)
      return FeedPage();
    else if (_navbarController.currentIndex.value == 1)
      return SearchPage();
    else if (_navbarController.currentIndex.value == 2)
      return CreatePostPage();
    else
      return Container();
  }

  _buildCreatePostAppbar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      toolbarHeight: getScreenHeight(110),
      title: Padding(
        padding: EdgeInsets.only(
          left: getScreenWidth(78),
          right: getScreenWidth(30),
        ),
        child: Row(
          children: [
            Text(
              "Create Post",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Spacer(),
            Text(
              "Post",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSearchAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: getScreenHeight(110),
      title: Container(
        height: getScreenHeight(40),
        width: double.infinity,
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
            enabledBorder: widget.outlineInputBorder,
            focusedBorder: widget.outlineInputBorder,
            border: widget.outlineInputBorder,
          ),
        ),
      ),
    );
  }

  _buildNotificationAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: getScreenHeight(110),
      centerTitle: false,
      title: Padding(
        padding: EdgeInsets.only(
          left: getScreenWidth(78),
        ),
        child: Text(
          "Notification",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  _buildFeedAppbar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      leading: Container(),
      title: Text(
        kGradeList[_gradeDropdownIndex],
        style: TextStyle(
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w500,
          fontSize: getScreenWidth(20),
          color: Color(0xFF282846),
        ),
      ),
    );
  }
}
