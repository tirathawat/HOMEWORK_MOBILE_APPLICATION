import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_mobile_application/src/config/size.dart';
import 'package:home_mobile_application/src/constants/asset.dart';
import 'package:home_mobile_application/src/constants/items_dropdown.dart';
import 'package:home_mobile_application/src/controller/navbar_controller.dart';
import 'package:home_mobile_application/src/pages/create_post/create_post_page.dart';
import 'package:home_mobile_application/src/pages/feed/feed_page.dart';
import 'package:home_mobile_application/src/pages/notification/notification.dart';
import 'package:home_mobile_application/src/pages/profile/profile_page.dart';
import 'package:home_mobile_application/src/pages/search/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _navbarController = Get.put(NavbarController());
  final int _gradeDropdownIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: SafeArea(
        child: _buildContent(),
      ),
      bottomNavigationBar: _buildNavbar(),
    );
  }

  Obx _buildNavbar() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
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
              icon: _navbarController.currentIndex.value == 0
                  ? SvgPicture.asset(Asset.HOME_CLICK_ICON)
                  : SvgPicture.asset(Asset.HOME_ICON),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _navbarController.currentIndex.value == 1
                  ? SvgPicture.asset(Asset.SEARCH_CLICK_ICON)
                  : SvgPicture.asset(Asset.SEARCH_ICON),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _navbarController.currentIndex.value == 2
                  ? SvgPicture.asset(Asset.PLUS_CLICK_ICON)
                  : SvgPicture.asset(Asset.PLUS_ICON),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _navbarController.currentIndex.value == 3
                  ? SvgPicture.asset(Asset.MESSAGE_CLICK_ICON)
                  : SvgPicture.asset(
                      Asset.MESSAGE_ICON,
                    ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  _buildAppbar() {
    if (_navbarController.currentIndex.value == 0)
      return _buildFeedAppbar();
    else if (_navbarController.currentIndex.value == 1)
      return null;
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
      return NotificationPage();
  }

  _buildCreatePostAppbar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Text(
        "Create Post",
        style: TextStyle(
          color: Color(0xFF282846),
        ),
      ),
      actions: [
        SvgPicture.asset(Asset.SEND_ICON),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  _buildNotificationAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        "Notification",
        style: TextStyle(
          color: Color(0xFF282846),
        ),
      ),
    );
  }

  _buildFeedAppbar() => AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF282846), //change your color here
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: Transform.rotate(
          angle: pi / 2,
          child: Icon(Icons.arrow_forward_ios),
        ),
        title: Text(
          kGradeList[_gradeDropdownIndex],
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
            fontSize: getScreenWidth(20),
            color: Color(0xFF282846),
          ),
        ),
        actions: [
          SvgPicture.asset(
            Asset.SEARCH_CIRCLE_ICON,
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(ProfilePage());
            },
            child: SvgPicture.asset(
              Asset.PROFILE_CIRCLE_ICON,
            ),
          ),
          SizedBox(
            width: getScreenWidth(16),
          ),
        ],
      );
}
